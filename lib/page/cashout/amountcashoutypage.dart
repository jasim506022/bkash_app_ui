import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/draw_widget.dart';
import 'confirmcashout.dart';

class CashOutAmountPage extends StatefulWidget {
  const CashOutAmountPage({super.key, this.number});

  final String? number;

  @override
  State<CashOutAmountPage> createState() => _CashOutAmountPageState();
}

class _CashOutAmountPageState extends State<CashOutAmountPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  String amount = "";
  @override
  Widget build(BuildContext context) {
    ContractModel contractModel = Provider.of<ContractModel>(
      context,
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(
            "Cash Out ",
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Amount",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => amount = value),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 55,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider.value(
                                              value: contractModel,
                                              child: ConfirmCashOutPage(
                                                amount: amount,
                                              )),
                                    ));
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                color: grey,
                                size: 40,
                              ),
                            ),
                            hintText: "৳0",
                            hintStyle: const TextStyle(
                                color: Colors.black45,
                                fontSize: 55,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none),
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Available Balance: ",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
                              text: "৳5.10 ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: mq.height * .018,
                      ),
                    ],
                  ),
                ),
                CardDesignWidget(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/sentmoney/typesentmoney/fnf.png",
                        height: mq.height * .048,
                        width: mq.height * .048,
                      ),
                      SizedBox(
                        width: mq.width * .022,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Tap to Cash Out ",
                            style: TextStyle(
                              color: pink,
                            )),
                        TextSpan(
                            text: "৳18.50 ",
                            style: TextStyle(
                                color: pink,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: pink)),
                        TextSpan(
                            text: "৳ 14.90/Thousand",
                            style: TextStyle(
                                color: pink, fontWeight: FontWeight.bold)),
                      ]))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
