import 'package:bkash_app_ui/widget/card_design_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../model/itemmodel.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/draw_widget.dart';

import '../../widget/row_icon_title_widget.dart';
import 'confirmsentmoney.dart';
import 'widget/select_item_to_sent_money_widget.dart';

class AmountSentMoneyPage extends StatefulWidget {
  const AmountSentMoneyPage({super.key, this.number});

  final String? number;

  @override
  State<AmountSentMoneyPage> createState() => _AmountSentMoneyPageState();
}

class _AmountSentMoneyPageState extends State<AmountSentMoneyPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  String amount = "";
  @override
  Widget build(BuildContext context) {
    final contractModel = Provider.of<ContractModel>(
      context,
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                                              child: ConfirmSentMoney(
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
                          text: const TextSpan(children: [
                            TextSpan(
                              text: "Available Balance: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
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
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select your purpose",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: mq.height * .165,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: nameSentMoneyItem.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                currentIndex = index;
                                setState(() {});
                              },
                              child: SelectItemToSentMoneyWidget(
                                  currentIndex: currentIndex, index: index),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const CardDesignWidget(
                    widget: RowIconTitleWidget(
                        image: "assets/sentmoney/typesentmoney/fnf.png",
                        title: "Add this number to Priyo List"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
