import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../const/approutes.dart';
import '../const/const.dart';
import '../globalcolor.dart';
import '../model/contractmodel.dart';
import 'contract_model_widget.dart';
import 'globalmethod.dart';

class LastConfirmShowDialog extends StatelessWidget {
  const LastConfirmShowDialog({
    super.key,
    required this.contractModel,
    required this.title,
  });

  final ContractModel contractModel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: white,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: mq.width * .95,
          height: mq.height * .9,
          padding: const EdgeInsets.only(
            top: 60,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), color: white),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mq.width * .044,
                        vertical: mq.height * .012),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "Your",
                                style: TextStyle(color: pink, fontSize: 16),
                              ),
                              TextSpan(
                                text: " $title",
                                style: TextStyle(
                                    color: pink,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                              TextSpan(
                                text: "is",
                                style: TextStyle(color: pink, fontSize: 16),
                              ),
                            ])),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: green, width: 1)),
                                child: Icon(
                                  Icons.done,
                                  color: green,
                                ))
                          ],
                        ),
                        Text(
                          "Succesffuly",
                          style: TextStyle(
                              color: green,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: mq.height * .012,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ContractModelWidget(
                              contractModel: contractModel,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: mq.height * .033,
                                    vertical: mq.height * .01),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: pink)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: pink,
                                    ),
                                    Text(
                                      "Call",
                                      style: TextStyle(
                                          color: pink,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ))
                          ],
                        ),
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
                                "Time",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "10:25am 28/11/23",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GlobalMethod.lineRow(
                          top: true,
                          bottom: true,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Transaction Id",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    transationId,
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await Clipboard.setData(
                                          ClipboardData(text: transationId));
                                      Fluttertoast.showToast(
                                          msg: "Text Copied!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: white,
                                          fontSize: 16.0);
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      size: 16,
                                      color: pink,
                                    ),
                                  )
                                ],
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
                          widget: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Reference",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GlobalMethod.lineRow(
                          bottom: true,
                          widget: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mq.height * .025,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: mq.width * .055),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: pink, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/sentmoney/auto_instalment_deduction.png",
                          height: mq.height * .03,
                          width: mq.height * .03,
                        ),
                        SizedBox(
                          width: mq.width * .022,
                        ),
                        Text(
                          "Enable Auto Play",
                          style: TextStyle(
                              color: pink, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mq.height * .035,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: pink),
                          child: Icon(
                            Icons.star,
                            color: white,
                            size: 25,
                          ),
                        ),
                        const Text(
                          'You have earned',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          'bKash Reward Points',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          const TextSpan(
                            text: "To use your points, check yours",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: " bkash Rewards",
                            style: TextStyle(
                                color: pink,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: pink),
                          )
                        ])),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: InkWell(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, AppsRoutes.mainPage, (route) => false),
                  child: Container(
                    height: mq.height * .065,
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .022),
                    width: mq.width * .95,
                    decoration: BoxDecoration(color: pink),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Back to home",
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: white,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
