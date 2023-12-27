import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../model/contractmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/contract_list_widget.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/drawerbuttonwidget.dart';
import '../../widget/drawwidget.dart';
import '../../widget/globalmethod.dart';
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
              horizontal: mq.width * .044, vertical: mq.height * .012),
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
                          builder: (context) =>
                              AmountSentMoneyPage(number: "01980846830"),
                        ));
                  },
                )),
                 CardDesignWidget(
                    widget: RowIconTitleWidget(
                  image: "assets/sentmoney/auto_instalment_deduction.png",
                  title: "Your Auto Payment (0)",
                )),
                 CardDesignWidget(
                    widget: RowIconTitleWidget(
                  image: "assets/sentmoney/application_unsuccessful_icon.png",
                  title: "Tap here to Send Money for free",
                )),
                _contractListWidget('Recent', recentList),
                _contractListWidget('All Contact', allContractList),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contractListWidget(String title, List<ContractModel> contractList) {
    return ContractListWidget(
      title: title,
      contractList: contractList,
      widget: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contractList.length,
        itemBuilder: (context, index) {
          return ContractModelWidget(
            contractModel: contractList[index],
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AmountSentMoneyPage(
                    contractModel: contractList[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }


}
