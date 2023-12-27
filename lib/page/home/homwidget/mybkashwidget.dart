import 'package:flutter/material.dart';
import '../../../const/const.dart';
import '../../../model/itemmodel.dart';
import '../../../widget/globalmethod.dart';

class MyBkashWidget extends StatelessWidget {
  const MyBkashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(mq.width * .024),
      child: Column(
        children: [
          GlobalMethod.homePageRowWidget(
              context: context, list: myBikashWidgetList, title: 'My Bkash'),
        GlobalMethod.  gridViewHorizontalDirector(list: myBikashWidgetList),
        ],
      ),
    );
  }


}
