import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../const/const.dart';
import '../../../globalcolor.dart';
import '../../../model/contractmodel.dart';
import '../amountrechargepage.dart';

class RechargeShowBottoSheetWidget extends StatelessWidget {
  const RechargeShowBottoSheetWidget({
    super.key,
    required this.contractModel,
  });
  final ContractModel contractModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .044, vertical: mq.height * .02),
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
                        builder: (context) => ChangeNotifierProvider.value(
                            value: contractModel,
                            child: RechargeAmountPage(
                              image: rechargeBkash[index],
                            )),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: white, border: Border.all(color: Colors.black12)),
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(
                    rechargeBkash[index],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            itemCount: rechargeBkash.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 3,
              mainAxisSpacing: 0, // Adjust spacing as needed
              crossAxisSpacing: 0, // Adjust spacing as needed
            ),
          ),
        ),
      ],
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
