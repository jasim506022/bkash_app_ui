import 'package:bkash_app_ui/widget/card_design_widget.dart';
import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../model/contractmodel.dart';
import '../../widget/contract_model_widget.dart';
import '../../widget/drawerbuttonwidget.dart';
import '../../widget/drawwidget.dart';
import 'confirmrechargemoney.dart';

class RechargeAmountPage extends StatefulWidget {
  const RechargeAmountPage({
    super.key,
    required this.contractModel,
    required this.image,
  });

  final ContractModel contractModel;
  final String image;

  @override
  State<RechargeAmountPage> createState() => _RechargeAmountPageState();
}

class _RechargeAmountPageState extends State<RechargeAmountPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  int acount = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                          ContractModelWidget(
                            contractModel: widget.contractModel,
                          ),
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
                    widget: Padding(
                  padding: EdgeInsets.symmetric(vertical: mq.height * .02),
                  child: SizedBox(
                      height: mq.height * .03,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: simOffer.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              simOffer[index],
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        },
                      )),
                )),
                CardDesignWidget(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: mq.height * .282,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: amount.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(color: pink)),
                                      child: Text(
                                        "৳${amount[index]}",
                                        style: TextStyle(
                                            color: pink,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: TextFormField(
                                onChanged: (value) =>
                                    setState(() => acount = int.parse(value)),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 55,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ConfirmRechargeAmount(
                                                amount: acount.toString(),
                                                image: widget.image,
                                                contractModel:
                                                    widget.contractModel,
                                              ),
                                            ));
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: grey,
                                        size: 40,
                                      ),
                                    ),
                                    hintText: "৳0",
                                    hintStyle: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 55,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: "Available Balance: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "৳5.10 ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: mq.height * .018,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> simOffer = ["Amount", "Internet", "Voice", "Bundle"];
  List<String> amount = ["30", "40", "50", "60"];
}
