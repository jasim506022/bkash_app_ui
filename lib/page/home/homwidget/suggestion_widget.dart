import 'package:bkash_app_ui/model/itemmodel.dart';
import 'package:bkash_app_ui/widget/globalmethod.dart';
import 'package:flutter/material.dart';

import '../../../const/const.dart';

class SuggestionWidget extends StatefulWidget {
  const SuggestionWidget({Key? key}) : super(key: key);

  @override
  State<SuggestionWidget> createState() => _SuggestionWidgettState();
}

class _SuggestionWidgettState extends State<SuggestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(mq.width * .024),
      child: Column(
        children: [
          GlobalMethod.homePageRowWidget(
              context: context, list: mySuggestionList, title: "Suggestion"),
           GlobalMethod.  gridViewHorizontalDirector(list: mySuggestionList),
        ],
      ),
    );
  }
}
