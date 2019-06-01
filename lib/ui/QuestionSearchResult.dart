import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_nlp/model/question_list.dart';
import 'package:stack_nlp/util/AppConstants.dart';
import 'package:stack_nlp/util/ColorUtil.dart';

import 'RoundedImage.dart';

// ignore: must_be_immutable
class QuestionSearchResult extends StatelessWidget {
  QuestionSearchResult({Key key}) : super(key: key);
  List<Question> questionCardList = new List();

  double photoWidth = 0.0;

  QuestionSearchResult.withQuestionList({
    this.questionCardList,
  });

  @override
  Widget build(BuildContext context) {
    return buildPhotoView(context);
  }

  Widget buildPhotoView(BuildContext context) {
    return createPhotoView(context);
  }

  Widget _label(String text, double textSize) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.padding10),
      child: Text(text,
          style: TextStyle(
              color: ColorUtil.appListTextColor(), fontSize: textSize)),
    );
  }

  Widget createPhotoView(BuildContext context) {
    return SliverList(
        delegate:
            SliverChildBuilderDelegate((BuildContext context, int position) {
      String random = "listTag" + questionCardList[position].questionId.toString();
      return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Wrap(children: <Widget>[
                  _label(questionCardList[position].title, 20)
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(AppConstants.padding10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.visibility,
                            color: Colors.black54,
                          ),
                          _label(
                              questionCardList[position].viewCount.toString(), 14),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.comment,
                          color: Colors.black54,
                        ),
                        _label(
                            questionCardList[position].answerCount.toString(), 12)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.thumb_up,
                          color: Colors.black54,
                        ),
                        _label(questionCardList[position].score.toString(), 12),
                      ],
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _label("Posted by : ", 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Hero(
                                    tag: random,
                                    child: Material(
                                      color: ColorUtil.backgroundColor(),
                                      child: InkWell(
                                        child: RoundedImage(
                                            photoUrl: questionCardList[position]
                                                .owner.profileImage),
                                      ),
                                    )),
                              ),
                            ),
                            _label(questionCardList[position].owner.displayName, 12),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        onTap: () => {
              //TODO:implement detail view
              /*AppNavigator.viewPhoto(
              context,
              userCardList[position].photoUrl,
              random,
              userCardList[position].photoName)*/
            },
      );
    }, childCount: questionCardList.length));
  }
}
