import 'package:flutter/material.dart';

import '../const/const.dart';
import '../globalcolor.dart';
import '../model/itemmodel.dart';
import 'bottom_model_widget.dart';

class HomePageRowWidget extends StatelessWidget {
  const HomePageRowWidget({
    super.key,
    required this.title,
    required this.itemModel,
  });
  final String title;
  final List<ItemModel> itemModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(mq.width * .02),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black54),
          ),
          GestureDetector(
            onTap: () {
              showBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  backgroundColor: white,
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return BottomModelWidget(
                      itemList: itemModel,
                      title: title,
                    );
                  });
            },
            child: Text(
              'See All',
              style: TextStyle(color: pink, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
