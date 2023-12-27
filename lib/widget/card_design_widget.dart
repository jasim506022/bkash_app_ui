import 'package:flutter/material.dart';

import '../const/const.dart';
import '../globalcolor.dart';

class CardDesignWidget extends StatelessWidget {
  const CardDesignWidget({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: white,
      child: Container(
        color: white,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .033, vertical: mq.height * .008),
            child: widget),
      ),
    );
  }
}
