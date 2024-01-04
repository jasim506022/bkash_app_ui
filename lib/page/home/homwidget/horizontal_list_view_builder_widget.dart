
import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../globalcolor.dart';
import '../../../model/itemmodel.dart';
import '../../../widget/globalmethod.dart';

class HorizontalListViewBuilderWidget extends StatelessWidget {
  const HorizontalListViewBuilderWidget({super.key, required this.list});
  final List<ItemModel> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: grey),
      ),
      height: mq.height * .1,
      width: mq.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, list[index].pushName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: mq.width * .03),
              child:
                  GlobalMethod.menuItem(list[index].image, list[index].title),
            ),
          );
        },
        itemCount: myBikashWidgetList.length,
      ),
    );
    
  }
}

