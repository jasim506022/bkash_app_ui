import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../globalcolor.dart';
import '../../../model/itemmodel.dart';

class SelectItemToSentMoneyWidget extends StatelessWidget {
  const SelectItemToSentMoneyWidget({
    super.key,
    required this.currentIndex,
    required this.index,
  });

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mq.height * .1412,
      width: mq.width * .244,
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(color: white, boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: .4)
      ]),
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                nameSentMoneyItem[index].image,
                height: mq.height * .11,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                nameSentMoneyItem[index].title,
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w400),
              )
            ],
          ),
          if (currentIndex == index)
            Positioned(
              right: 0,
              child: Container(
                decoration: BoxDecoration(color: pink, shape: BoxShape.circle),
                child: Icon(
                  Icons.done,
                  color: white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
