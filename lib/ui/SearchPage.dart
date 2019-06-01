import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_nlp/blocs/nlp_bloc.dart';
import 'package:stack_nlp/blocs/question_bloc.dart';
import 'package:stack_nlp/blocs/user_bloc.dart';
import 'package:stack_nlp/model/AnalyzeEntity.dart';
import 'package:stack_nlp/model/question_list.dart';
import 'package:stack_nlp/model/user_list.dart';
import 'package:stack_nlp/util/AppConstants.dart';
import 'package:stack_nlp/util/ColorUtil.dart';

import 'QuestionSearchResult.dart';
import 'UserSearchResult.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  TextEditingController _controller = new TextEditingController(text: "");
  FocusNode _textFocus = new FocusNode();
  bool isInEditMode = true;

  String _searchedText = "";

  @override
  void initState() {
    super.initState();
    _searchedText = "";
    _controller.text = _searchedText;
    _controller.addListener(onTextChanged);
    _textFocus.addListener(onTextChanged);
  }

  void onTextChanged() {
    _searchedText = _controller.text;
    bool hasFocus = _textFocus.hasFocus;

    if (hasFocus) {
      isInEditMode = true;
    } else {
      isInEditMode = false;
    }
  }

  Widget _addAction() {
    return IconButton(
        icon: Icon(Icons.search),
        color: ColorUtil.actionItemColor(),
        onPressed: () {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: BouncingScrollPhysics(), slivers: <Widget>[
      SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(AppConstants.padding20),
            child: Form(
              child: TextFormField(
                maxLines: 1,
                textCapitalization: TextCapitalization.sentences,
                controller: _controller,
                focusNode: _textFocus,
                onFieldSubmitted: (term) {
                  nlpBloc.findEntityOfText(_searchedText);
                },
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(
                    hintText: AppConstants.hintText,
                    counterText: "",
                    focusedBorder: UnderlineInputBorder(),
                    border: InputBorder.none,
                    suffixIcon: _addAction()),
              ),
            ),
          ),
        ]));
      }, childCount: 1)),
      _buildSearchResult()
    ]);
  }

  Widget _buildUserList(){
    userBloc.fetchUserList(_searchedText);
    return new StreamBuilder(
      stream: userBloc.findUsers,
      builder: (context, AsyncSnapshot<UserList> snapshot) {
        if (snapshot.hasData) {
          return UserSearchResult.withUserList(userCardList: snapshot.data.items);
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter();
        }
        return SliverToBoxAdapter();
      },
    );
  }
  Widget _buildQuestionList(){
    questionBloc.fetchQuestions(_searchedText,false);
    return new StreamBuilder(
      stream: questionBloc.findQuestions,
      builder: (context, AsyncSnapshot<QuestionList> snapshot) {
        if (snapshot.hasData) {
          return QuestionSearchResult.withQuestionList(questionCardList: snapshot.data.items);
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter();
        }
        return SliverToBoxAdapter();
      },
    );
  }


  Widget _buildSearchResult() {
    return new StreamBuilder(
      stream: nlpBloc.findEntity,
      builder: (context, AsyncSnapshot<AnalyzedEntity> snapshot) {
        if (snapshot.hasData) {
          if(snapshot.data.entities[0].type==AppConstants.TYPE){
            return _buildUserList();
          }else{
            return  _buildQuestionList();
          }
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter();
        }
        return SliverToBoxAdapter();
      },
    );
  }


}
