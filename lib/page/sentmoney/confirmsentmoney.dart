import 'package:bkash_app_ui/const/const.dart';
import 'package:bkash_app_ui/widget/confirm_show_dialog_widget.dart';
import 'package:bkash_app_ui/widget/draw_widget.dart';
import 'package:bkash_app_ui/widget/globalmethod.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/confirm_row_amount_widget.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/drawer_button_widget.dart';

class ConfirmSentMoney extends StatefulWidget {
  const ConfirmSentMoney({super.key, required this.amount});

  final String amount;

  @override
  State<ConfirmSentMoney> createState() => _ConfirmSentMoneyState();
}

class _ConfirmSentMoneyState extends State<ConfirmSentMoney> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final contractModel = Provider.of<ContractModel>(
      context,
    );
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Sent Money",
        ),
        actions: [DrawerButtonWidget(scaffoldKey: scaffoldKey)],
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Reference",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Tap to add note",
                              hintStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                              border: InputBorder.none),
                        )
                      ],
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
                                        title: 'Sent Money',
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
