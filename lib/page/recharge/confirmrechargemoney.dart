import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/confirm_row_amount_widget.dart';
import '../../widget/confirm_show_dialog_widget.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/draw_widget.dart';
import '../../widget/globalmethod.dart';

class ConfirmRechargeAmount extends StatefulWidget {
  const ConfirmRechargeAmount({
    super.key,
    required this.amount,
    required this.image,
  });

  final String amount;
  final String image;

  @override
  State<ConfirmRechargeAmount> createState() => _ConfirmRechargeAmountState();
}

class _ConfirmRechargeAmountState extends State<ConfirmRechargeAmount> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final contractModel = Provider.of<ContractModel>(
      context,
    );
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
        padding: EdgeInsets.symmetric(horizontal: mq.width * .044),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardDesignWidget(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "To",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ContractModelWidget(),
                        Container(
                          height: mq.height * .07,
                          width: mq.height * .07,
                          decoration: const BoxDecoration(
                              color: Colors.black12, shape: BoxShape.circle),
                          child: ClipOval(
                            child: Image.asset(
                              widget.image,
                              height: mq.height * .05,
                              width: mq.height * .05,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              CardDesignWidget(
                widget: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: mq.height * .01),
                      child: ConfirmRowAmountWidget(amount: widget.amount),
                    ),
                    GlobalMethod.dividerLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text(
                            "Select Type",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: SizedBox(
                            height: mq.height * .08,
                            width: mq.width,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: ListView.builder(
                                itemCount: simName.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () =>
                                        setState(() => currentIndex = index),
                                    child: _buildSelectSIMItem(index),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    GlobalMethod.dividerLine(),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: pink,
                          fontSize: 50,
                          fontWeight: FontWeight.w800),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: pink,
                            size: 30,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return ChangeNotifierProvider.value(
                                      value: contractModel,
                                      child: const ConfirmShowDialogWidget(
                                        title: 'Mobile Recharge',
                                        isSentMoney: false,
                                      ));
                                },
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: grey,
                              size: 30,
                            ),
                          ),
                          hintText: "Enter PIN",
                          hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSelectSIMItem(int index) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: currentIndex == index ? pink : white,
          border: Border.all(color: pink, width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        simName[index],
        style: TextStyle(
            color: currentIndex == index ? white : pink,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  List<String> simName = ["Prepaid", "Postpaid"];
}
