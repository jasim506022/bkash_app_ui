import 'package:flutter/material.dart';
import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../widget/contract_list_widget.dart';
import '../../widget/globalmethod.dart';
import '../../widget/row_icon_title_widget.dart';
import '../../widget/top_to_scan_widget.dart';

class AgentTabPage extends StatefulWidget {
  const AgentTabPage({super.key});

  @override
  State<AgentTabPage> createState() => _AgentTabPageState();
}

class _AgentTabPageState extends State<AgentTabPage> {
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
              const TopToScanWidget(
                title: "Enable Auto Play",
              ),
              GlobalMethod.dividerLine(),
              Image.asset("assets/banner.png"),
              const SizedBox(
                height: 8,
              ),
              GlobalMethod.dividerLine(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * .033, vertical: mq.height * .008),
                child: const RowIconTitleWidget(
                  image: "assets/sentmoney/auto_instalment_deduction.png",
                  title: "Your Auto Payment (0)",
                ),
              ),
              GlobalMethod.dividerLine(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * .033, vertical: mq.height * .008),
                child: const RowIconTitleWidget(
                  image: "assets/sentmoney/application_unsuccessful_icon.png",
                  title: "Tap here to Send Money for free",
                ),
              ),
              GlobalMethod.dividerLine(),
              ContractListWidget(
                title: 'Recent',
                contractList: recentList,
                cashout: true,
              ),
              ContractListWidget(
                  title: 'Save Agents Numbert',
                  contractList: allContractList,
                  cashout: true,
                  isRemove: true),
            ],
          ),
        ),
      ),
    ));
  }
}
