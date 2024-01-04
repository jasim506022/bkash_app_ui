import 'package:bkash_app_ui/widget/confirm_show_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/confirm_row_amount_widget.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/draw_widget.dart';
import '../../widget/globalmethod.dart';

class ConfirmCashOutPage extends StatefulWidget {
  const ConfirmCashOutPage({super.key, required this.amount});

  final String amount;

  @override
  State<ConfirmCashOutPage> createState() => _ConfirmCashOutPageState();
}

class _ConfirmCashOutPageState extends State<ConfirmCashOutPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ContractModel contractModel = Provider.of<ContractModel>(
      context,
    );
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
              const CardDesignWidget(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    ContractModelWidget()
                  ],
                ),
              ),
              CardDesignWidget(
                widget: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: mq.height * .02),
                      child: ConfirmRowAmountWidget(amount: widget.amount),
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
                                  return ChangeNotifierProvider.value(
                                      value: contractModel,
                                      child: const ConfirmShowDialogWidget(
                                        title: 'Cash Out',
                                        isSentMoney: true,
                                        
                                      ));
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
