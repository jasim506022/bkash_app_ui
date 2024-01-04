import 'package:flutter/material.dart';

import '../const/const.dart';

class GlobalMethod {
  static Column menuItem(String imagePath, String text) => Column(
        children: [
          Image.asset(
            imagePath,
            width: mq.height * .062,
            height: mq.height * .062,
          ),
          FittedBox(
            child: Text(
              text,
              style: const TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ),
        ],
      );

  static Divider dividerLine() {
    return const Divider(
      color: Colors.black12,
    );
  }

  static Container lineRow(
      {required Widget widget,
      bool top = false,
      bool bottom = false,
      bool left = false,
      bool right = false}) {
    return Container(
        height: mq.height * .09,
        padding: EdgeInsets.only(left: mq.width * .066),
        decoration: BoxDecoration(
            border: Border(
          top: top ? const BorderSide(color: Colors.black12) : BorderSide.none,
          bottom: bottom
              ? const BorderSide(color: Colors.black12)
              : BorderSide.none,
          left:
              left ? const BorderSide(color: Colors.black12) : BorderSide.none,
          right:
              right ? const BorderSide(color: Colors.black12) : BorderSide.none,
        )),
        child: widget);
  }

  static SliverGridDelegateWithFixedCrossAxisCount
      silverGRidDelegratWtihFixedCrossAxisCountMethod() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      mainAxisSpacing: mq.width * .08,
      crossAxisSpacing: mq.width * .1,
    );
  }
}
