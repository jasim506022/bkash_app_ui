import 'package:bkash_app_ui/model/itemmodel.dart';
import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../widget/home_page_row_widget.dart';
import 'horizontal_list_view_builder_widget.dart';

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
          HomePageRowWidget(
            itemModel: mySuggestionList,
            title: 'Suggestion',
          ),
          HorizontalListViewBuilderWidget(list: mySuggestionList),
        ],
      ),
    );
  }
}
