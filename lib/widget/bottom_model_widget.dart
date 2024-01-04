import 'package:flutter/material.dart';

import '../const/const.dart';
import '../globalcolor.dart';
import '../model/itemmodel.dart';
import 'globalmethod.dart';

class BottomModelWidget extends StatelessWidget {
  const BottomModelWidget(
      {Key? key, required this.itemList, required this.title})
      : super(key: key);

  final List<ItemModel> itemList;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mq.height * .4,
      color: white,
      child: Container(
        margin: EdgeInsets.all(mq.width * .036),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(color: pink, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: mq.height * .04),
              child: Container(
                color: white,
                height: mq.height * .23,
                child: GridView.builder(
                    physics:
                        const NeverScrollableScrollPhysics(), //cannot scroll the gridview section
                    itemBuilder: (context, index) {
                      return Container(
                        child: GlobalMethod.menuItem(
                            itemList[index].image, itemList[index].title),
                      );
                    },
                    itemCount: 8,
                    gridDelegate: GlobalMethod
                        .silverGRidDelegratWtihFixedCrossAxisCountMethod()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
