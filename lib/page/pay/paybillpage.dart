import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../model/itemmodel.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/draw_widget.dart';
import '../../widget/globalmethod.dart';
import '../../widget/row_icon_title_widget.dart';
import '../../widget/search_name_number_widget.dart';

class PayBillPage extends StatefulWidget {
  const PayBillPage({super.key});

  @override
  State<PayBillPage> createState() => _PayBillPageState();
}

class _PayBillPageState extends State<PayBillPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(
            "Pay Bill",
          ),
          actions: [DrawerButtonWidget(scaffoldKey: scaffoldKey)],
        ),
        endDrawer: const DrawerWidget(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .044, vertical: mq.height * .012),
          child: Column(
            children: [
              CardDesignWidget(
                  widget: SearchNameNumberWidget(
                title: 'To',
                function: () {},
              )),
              CardDesignWidget(
                widget: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "My Organization",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        ),
                        Text(
                          "Manage (1)",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: pink),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                            flex: 3,
                            child: Image.asset("assets/dot_internet.png")),
                        const SizedBox(
                          width: 20,
                        ),
                        const Flexible(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dot Internet",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Bill Account Number: 14148",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Dot Internet",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Last Paid: December, 2023",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  CardDesignWidget(
                    widget: RowIconTitleWidget(
                        image: "assets/pay_bill_image.png",
                        title: "Receipts & Tokens"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CardDesignWidget(
                    widget: RowIconTitleWidget(
                        image: "assets/statement.png",
                        title: "Pay Bill History"),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      "All Organization",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  GlobalMethod.dividerLine(),
                  const SizedBox(
                    height: 10,
                  ),
                  _builAllOrgnizationList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _builAllOrgnizationList() {
    return Container(
      height: mq.height * .32,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          color: white,
        ),
        child: InkWell(
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: mq.height * .05,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(color: pink.withOpacity(.3))),
                        child: Image.asset(
                          organizationList[index].image,
                          color: pink,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          organizationList[index].title,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: organizationList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: mq.width * .05,
                crossAxisSpacing: mq.width * .08,
              )),
        ),
      ),
    );
  }
}
