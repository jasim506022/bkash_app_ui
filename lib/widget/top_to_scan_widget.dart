import 'package:flutter/material.dart';

import '../const/const.dart';
import '../globalcolor.dart';

class TopToScanWidget extends StatelessWidget {
  const TopToScanWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mq.height * .018),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: mq.width * .033),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: pink, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.document_scanner_outlined,
              size: 25,
              color: pink,
            ),
            SizedBox(
              width: mq.width * .022,
            ),
            Text(
              title,
              style: TextStyle(color: pink, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
