import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/const.dart';
import '../globalcolor.dart';
import '../model/contractmodel.dart';
import 'contract_model_widget.dart';

class ContractListWidget extends StatelessWidget {
  const ContractListWidget({
    super.key,
    required this.title,
    required this.contractList,
    this.isRemove = false,
    this.isSentMoney = false,
    this.recharge = false,
    this.cashout = false,
  });
  final bool? isRemove;
  final String title;
  final bool? isSentMoney;
  final bool? recharge;
  final bool? cashout;
  final List<ContractModel> contractList;

  @override
  Widget build(BuildContext context) {
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
                      return ChangeNotifierProvider.value(
                        value: contractList[index],
                        child: ContractModelWidget(
                          isRemove: isRemove,
                          isSentMoney: isSentMoney,
                          recharge: recharge,
                          cashout: cashout,
                        ),
                      );
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
}
