import 'package:bkash_app_ui/page/cashout/amountcashoutypage.dart';
import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../widget/contract_list_widget.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/globalmethod.dart';
import '../../widget/top_to_scan_widget.dart';

class TabOnePage extends StatefulWidget {
  const TabOnePage({super.key});

  @override
  State<TabOnePage> createState() => _TabOnePageState();
}

class _TabOnePageState extends State<TabOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: white,
        child: Container(
          color: white,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.grey.withOpacity(.8),
                          size: 25,
                        ),
                      ),
                      hintText: "Enter name or number",
                      hintStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                      border: InputBorder.none),
                ),
              ),
              GlobalMethod.dividerLine(),
               const TopToScanWidget(title:  "Enable Auto Play",),
              GlobalMethod.dividerLine(),
              Image.asset("assets/banner.png"),
              const SizedBox(
                height: 8,
              ),
              GlobalMethod.dividerLine(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * .033, vertical: mq.height * .008),
                child:  RowIconTitleWidget(
                  image: "assets/sentmoney/auto_instalment_deduction.png",
                  title: "Your Auto Payment (0)",
                ),
              ),
              GlobalMethod.dividerLine(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * .033, vertical: mq.height * .008),
                child:  RowIconTitleWidget(
                  image: "assets/sentmoney/application_unsuccessful_icon.png",
                  title: "Tap here to Send Money for free",
                ),
              ),
              GlobalMethod.dividerLine(),
              _contractListWidget('Recent', recentList),
              _contractListWidget('Save Agents Number', allContractList,
                  isRemove: true),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _contractListWidget(String title, List<ContractModel> contractList,
      {bool isRemove = false}) {
    return ContractListWidget(
      title: title,
      contractList: contractList,
      widget: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contractList.length,
        itemBuilder: (context, index) {
          return ContractModelWidget(
            contractModel: contractList[index],
            isRemove: isRemove = isRemove,
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CashOutAmountPage(
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

/*
  Card _contractList(
      {required String title,
      required List<ContractModel> contractList,
      bool? isRemove = false}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        color: white,
        height: mq.height * .048 +
            (mq.height * .099 * contractList.length.toDouble()),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .033, vertical: mq.height * .012),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: Colors.black12,
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: contractList.length,
                    itemBuilder: (context, index) {
                      if (isRemove!) {
                        return GlobalMethod.buildRowNumber(
                            contractModel: contractList[index],
                            function: () {});
                      } else {
                        return ContractModelWidget(
                            contractModel: contractList[index],
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CashOutAmountPage(
                                      contractModel: contractList[index],
                                    ),
                                  ));
                            });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
*/
}
