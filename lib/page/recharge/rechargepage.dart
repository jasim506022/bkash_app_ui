import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../../model/contractmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/contract_list_widget.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/draw_widget.dart';

import '../../widget/row_icon_title_widget.dart';
import '../../widget/search_name_number_widget.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Mobile Recharge",
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
                title: 'For',
                function: () {},
              )),
              const CardDesignWidget(
                  widget: RowIconTitleWidget(
                image: "assets/sentmoney/auto_instalment_deduction.png",
                title: "Your Auto Payment (0)",
              )),
              CardDesignWidget(
                  widget: ChangeNotifierProvider.value(
                value: recentList[0],
                child: const ContractModelWidget(
                  name: "Md Jasim Uddin",
                  number: "01980846830",
                  image: "assets/jasim.jpg",
                ),
              )),
              ContractListWidget(
                title: 'Recent',
                contractList: recentList,
                recharge: true,
              ),
              ContractListWidget(
                title: 'All Contact',
                contractList: allContractList,
                recharge: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
