import 'package:flutter/material.dart';
import '../../../const/const.dart';
import '../../../model/itemmodel.dart';
import '../../../widget/home_page_row_widget.dart';
import 'horizontal_list_view_builder_widget.dart';

class MyBkashWidget extends StatelessWidget {
  const MyBkashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(mq.width * .024),
      child: Column(
        children: [
          HomePageRowWidget(
            itemModel: myBikashWidgetList,
            title: 'My Bkash',
          ),
          HorizontalListViewBuilderWidget(list: myBikashWidgetList),
        ],
      ),
    );
  }
}
