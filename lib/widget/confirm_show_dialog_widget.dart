import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/const.dart';
import '../globalcolor.dart';
import '../model/contractmodel.dart';
import 'contract_model_widget.dart';
import 'globalmethod.dart';
import 'last_confirm_show_dialog_widget.dart';

class ConfirmShowDialogWidget extends StatelessWidget {
  const ConfirmShowDialogWidget(
      {super.key, required this.title, this.isSentMoney = false});

  final String title;
  final bool? isSentMoney;

  @override
  Widget build(BuildContext context) {
    final contractModel = Provider.of<ContractModel>(
      context,
    );
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: mq.width * .92,
        height: mq.height * .9,
        padding: EdgeInsets.symmetric(vertical: mq.height * .012),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: white),
        child: Stack(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: pink,
                        size: 30,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mq.width * .044, vertical: mq.height * .02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: mq.height * .04,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Confirm to",
                            style: TextStyle(
                                color: pink,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: " $title",
                            style: TextStyle(
                                color: pink,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ])),
                      const ContractModelWidget(),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GlobalMethod.lineRow(
                        top: true,
                        bottom: true,
                        right: true,
                        widget: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "৳ 5.00",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "+ No charge",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GlobalMethod.lineRow(
                        top: true,
                        bottom: true,
                        widget: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New Balance",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "৳ 5.00",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GlobalMethod.lineRow(
                        bottom: true,
                        right: true,
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isSentMoney! ? "Reference" : "Type",
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              isSentMoney! ? "" : "Prepaid",
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GlobalMethod.lineRow(
                        bottom: true,
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: isSentMoney!
                              ? []
                              : [
                                  const Text(
                                    "Mobile Operator",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Text(
                                    "Banglalink",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (isSentMoney!)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mq.width * .055,
                        vertical: mq.height * .022),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/sentmoney/typesentmoney/fnf.png",
                            height: mq.height * .048, width: mq.height * .048),
                        SizedBox(
                          width: mq.height * .012,
                        ),
                        Expanded(
                          child: Text(
                            "You can sent money free up to 25,000 tk. monely by addding Priyo Number.",
                            style: TextStyle(
                                color: pink, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: InkWell(
                onLongPress: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                          value: contractModel,
                          child: LastConfirmShowDialog(
                            title: title,
                          ));
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: mq.height * .148,
                  width: mq.width,
                  decoration: BoxDecoration(
                      color: pink,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(120),
                          topLeft: Radius.circular(120))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/bkash.png",
                        height: mq.height * .071,
                        width: mq.height * .071,
                        color: white,
                      ),
                      Text(
                        "Tap and hold for Send Moeny",
                        style: TextStyle(color: white),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
