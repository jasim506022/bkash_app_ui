import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/contract_list_widget.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/drawerbuttonwidget.dart';
import '../../widget/drawwidget.dart';
import '../../widget/globalmethod.dart';
import '../../widget/search_name_number_widget.dart';
import 'amountrechargepage.dart';

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
               CardDesignWidget(
                  widget: RowIconTitleWidget(
                image: "assets/sentmoney/auto_instalment_deduction.png",
                title: "Your Auto Payment (0)",
              )),
              CardDesignWidget(
                  widget: ContractModelWidget(
                name: "Md Jasim Uddin",
                number: "01980846830",
                image: "assets/jasim.jpg",
              )),
              _contractListWidget('Recent', recentList),
              _contractListWidget('All Contact', allContractList),
            ],
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
              showBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                enableDrag: true,
                context: context,
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mq.width * .044,
                            vertical: mq.height * .02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Choose the Operator',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: pink,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Choose the current operator for this number',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: mq.height * .032,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: white,
                        height: mq.height * .23,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RechargeAmountPage(
                                        contractModel: contractList[index],
                                        image: rechargeBkash[index],
                                      ),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(color: Colors.black12)),
                                padding: const EdgeInsets.all(25),
                                child: Image.asset(
                                  rechargeBkash[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                          itemCount: rechargeBkash.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.5,
                            crossAxisCount: 3,
                            mainAxisSpacing: 0, // Adjust spacing as needed
                            crossAxisSpacing: 0, // Adjust spacing as needed
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

var rechargeBkash = [
  'assets/recharge/sim/bangla.png',
  'assets/recharge/sim/grapmin.png',
  'assets/recharge/sim/robi.png',
  'assets/recharge/sim/skitto.png',
  'assets/recharge/sim/teletalk.png',
  'assets/recharge/sim/teletalk.png',
];
