import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_nlp/model/user_list.dart';
import 'package:stack_nlp/util/AppConstants.dart';
import 'package:stack_nlp/util/ColorUtil.dart';

import 'RoundedImage.dart';

class UserSearchResult extends StatelessWidget {
  UserSearchResult({Key key}) : super(key: key);
  List<UserModel> userCardList = new List();

  double photoWidth = 0.0;

  UserSearchResult.withUserList({
    this.userCardList,
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
      String random = "listTag" + userCardList[position].accountId.toString();
      return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                            tag: random,
                            child: Material(
                              color: ColorUtil.backgroundColor(),
                              child: InkWell(
                                child: RoundedImage(
                                    photoUrl:
                                        userCardList[position].profileImage),
                              ),
                            )),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _label(userCardList[position].displayName, 20),
                        _label(
                            "Reputation: " +
                                userCardList[position].reputation.toString(),
                            14),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(AppConstants.padding10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Icon(
                          Icons.location_city,
                          color: Colors.black54,
                        ),
                        _label(userCardList[position].location.toString(), 12)
                      ]),
                      Row(children: <Widget>[_label("", 12)])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () => {
              //TODO:implement detail view
            },
      );
    }, childCount: userCardList.length));
  }
}
