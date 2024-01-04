import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../model/contractmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/contract_list_widget.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/draw_widget.dart';

import '../../widget/row_icon_title_widget.dart';
import '../../widget/search_name_number_widget.dart';
import 'amountsentmoneypage.dart';

class SentMoneyPage extends StatefulWidget {
  const SentMoneyPage({super.key});

  @override
  State<SentMoneyPage> createState() => _SentMoneyPageState();
}

class _SentMoneyPageState extends State<SentMoneyPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).unfocus(),
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
          padding: EdgeInsets.symmetric(
            horizontal: mq.width * .044,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardDesignWidget(
                  widget: SearchNameNumberWidget(
                    title: 'To',
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AmountSentMoneyPage(
                                number: "01980846830"),
                          ));
                    },
                  ),
                ),
                const CardDesignWidget(
                  widget: RowIconTitleWidget(
                    image: "assets/sentmoney/auto_instalment_deduction.png",
                    title: "Your Auto Payment (0)",
                  ),
                ),
                const CardDesignWidget(
                  widget: RowIconTitleWidget(
                    image: "assets/sentmoney/application_unsuccessful_icon.png",
                    title: "Tap here to Send Money for free",
                  ),
                ),
                ContractListWidget(
                    title: 'Recent',
                    contractList: recentList,
                    isSentMoney: true),
                ContractListWidget(
                    title: 'All Contact',
                    contractList: allContractList,
                    isSentMoney: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
