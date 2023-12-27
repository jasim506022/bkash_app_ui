
import 'package:flutter/material.dart';

import '../const/const.dart';
import '../globalcolor.dart';
import '../model/contractmodel.dart';


class ContractListWidget extends StatelessWidget {
  const ContractListWidget({
    super.key,
    required this.title,
    required this.contractList, required this.widget,
  });

  final String title;
  final List<ContractModel> contractList;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        color: white,
        height: mq.height * .048 +
            (mq.height * .099 * contractList.length.toDouble()),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .033, vertical: mq.height * .012),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: Colors.black12,
              ),
              Expanded(
                child: SizedBox(
                  child: widget
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
