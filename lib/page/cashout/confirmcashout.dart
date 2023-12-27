import 'package:bkash_app_ui/const/const.dart';
import 'package:bkash_app_ui/widget/confirmshowdialogwidget.dart';
import 'package:bkash_app_ui/widget/drawwidget.dart';
import 'package:bkash_app_ui/widget/globalmethod.dart';
import 'package:flutter/material.dart';

import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/confirmamountwidget.dart';
import '../../widget/contract_model_widget.dart';

class ConfirmCashOutPage extends StatefulWidget {
  const ConfirmCashOutPage(
      {super.key, required this.contractModel, required this.amount});

  final ContractModel? contractModel;
  final String amount;

  @override
  State<ConfirmCashOutPage> createState() => _ConfirmCashOutPageState();
}

class _ConfirmCashOutPageState extends State<ConfirmCashOutPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Cash Out Page",
        ),
        actions: [
          Padding(
            padding:
                EdgeInsets.only(top: mq.height * .014, right: mq.height * .014),
            child: InkWell(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeEndDrawer();
                } else {
                  scaffoldKey.currentState!.openEndDrawer();
                }
              },
              child: SizedBox(
                  width: mq.width * .076,
                  height: mq.width * .076,
                  child: Image.asset('assets/logo.png')),
            ),
          )
        ],
      ),
      endDrawer: const DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * .044),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardDesignWidget(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "To",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    ContractModelWidget(contractModel: widget.contractModel!)
                  ],
                ),
              ),
              CardDesignWidget(
                widget: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: mq.height * .02),
                      child: ConfirmAmountWidget(amount: widget.amount),
                    ),
                    GlobalMethod.dividerLine(),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: pink,
                          fontSize: 50,
                          fontWeight: FontWeight.w800),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: pink,
                            size: 30,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return ConfirmShowDialogWidget(
                                    contractModel: widget.contractModel!,
                                    title: 'Cash Out',
                                    isSentMoney: true,
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: grey,
                              size: 30,
                            ),
                          ),
                          hintText: "Enter PIN",
                          hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
