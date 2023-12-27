import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/globalmethod.dart';
import '../../widget/search_name_number_widget.dart';

class CardTab extends StatefulWidget {
  const CardTab({super.key});

  @override
  State<CardTab> createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CardDesignWidget(
              widget: SizedBox(
            height: mq.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mq.height * .012,
                ),
                SearchNameNumberWidget(
                  title: 'Your bKash Account Number',
                  isIconshow: false,
                  function: () {},
                ),
                GlobalMethod.dividerLine(),
                SearchNameNumberWidget(
                  isIconshow: false,
                  title: 'Amount',
                  function: () {},
                ),
                GlobalMethod.dividerLine(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Min.amount ৳50.00",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: mq.height * .018,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select Your Cards",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                    Text(
                      "Manage (1)",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: pink),
                    ),
                  ],
                ),
                SizedBox(
                  height: mq.height * .012,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    leading: Container(
                      height: mq.height * .095,
                      width: mq.height * .095,
                      padding: const EdgeInsets.all(7),
                      decoration:
                          BoxDecoration(color: white, shape: BoxShape.circle),
                      child: Image.asset("assets/visa.png"),
                    ),
                    subtitle: const Text(
                      "xxxx xxxx xxxxx 568",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    trailing: const Icon(Icons.arrow_drop_down),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    ));
  }
}
