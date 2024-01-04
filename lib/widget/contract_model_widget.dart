import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/const.dart';
import '../globalcolor.dart';
import '../model/contractmodel.dart';
import '../page/cashout/amountcashoutypage.dart';
import '../page/recharge/widget/recharge_show_bottom_sheet_widget.dart';
import '../page/sentmoney/amountsentmoneypage.dart';

class ContractModelWidget extends StatelessWidget {
  const ContractModelWidget(
      {super.key,
      this.name,
      this.number,
      this.isRemove = false,
      this.image,
      this.isSentMoney,
      this.recharge,
      this.cashout});
  final String? name;
  final String? number;
  final String? image;
  final bool? isRemove;
  final bool? isSentMoney;
  final bool? recharge;
  final bool? cashout;

  @override
  Widget build(BuildContext context) {
    ContractModel contractModel = Provider.of<ContractModel>(
      context,
    );
    return InkWell(
      onTap: () {
        if (cashout!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                    value: contractModel, child: const CashOutAmountPage()),
              ));
        }

        if (isSentMoney!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                    value: contractModel, child: const AmountSentMoneyPage()),
              ));
        }
        if (recharge!) {
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
              return RechargeShowBottoSheetWidget(
                contractModel: contractModel,
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            image == null
                ? Image.asset(
                    "assets/sentmoney/global_avatar.png",
                    height: mq.height * .071,
                    width: mq.height * .071,
                  )
                : ClipOval(
                    child: Image.asset(
                      image!,
                      height: mq.height * .071,
                      width: mq.height * .071,
                    ),
                  ),
            SizedBox(
              width: mq.width * .044,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? contractModel.name,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                SizedBox(
                  height: mq.width * .005,
                ),
                Text(
                  number ?? contractModel.number,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                )
              ],
            ),
            if (isRemove!) const Spacer(),
            if (isRemove!)
              Text(
                "Remove",
                style: TextStyle(
                    color: pink, fontSize: 16, fontWeight: FontWeight.w700),
              )
          ],
        ),
      ),
    );
  }
}




      // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const AmountSentMoneyPage(),
        //   ),
        // );