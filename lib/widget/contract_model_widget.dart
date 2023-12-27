import 'package:flutter/material.dart';

import '../const/const.dart';
import '../globalcolor.dart';
import '../model/contractmodel.dart';

// ignore: must_be_immutable
class ContractModelWidget extends StatelessWidget {
  ContractModelWidget(
      {super.key,
      this.contractModel,
      this.function,
      this.name,
      this.number,
      this.isRemove = false,
      this.image});
  ContractModel? contractModel;
  Function? function;
  String? name;
  String? number;
  String? image;
  bool? isRemove;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function!();
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            image == null
                ? Image.asset(
                    "assets/sentmoney/global_avatar.png",
                    height: mq.height * .071,
                    width: mq.height * .071,
                  )
                : ClipOval(
                    child: Image.asset(
                      image!,
                      height: mq.height * .071,
                      width: mq.height * .071,
                    ),
                  ),
            SizedBox(
              width: mq.width * .044,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? contractModel!.name,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                SizedBox(
                  height: mq.width * .005,
                ),
                Text(
                  number ?? contractModel!.number,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                )
              ],
            ),
            if (isRemove!) const Spacer(),
            if (isRemove!)
              Text(
                "Remove",
                style: TextStyle(
                    color: pink, fontSize: 16, fontWeight: FontWeight.w700),
              )
          ],
        ),
      ),
    );
  }
}
