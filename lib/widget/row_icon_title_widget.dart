import 'package:flutter/material.dart';

import '../const/const.dart';
import '../globalcolor.dart';

class RowIconTitleWidget extends StatelessWidget {
  const RowIconTitleWidget(
      {super.key,
      required this.image,
      required this.title,
      this.isColor = false});
  final String image;
  final String title;
  final bool? isColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isColor!
            ? Image.asset(
                image,
                height: mq.height * .048,
                width: mq.height * .048,
                color: pink,
              )
            : Image.asset(
                image,
                height: mq.height * .048,
                width: mq.height * .048,
              ),
        SizedBox(
          width: mq.width * .022,
        ),
        Text(
          title,
          style: TextStyle(color: pink, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
