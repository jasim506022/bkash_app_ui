import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../widget/card_design_widget.dart';
import '../../widget/drawerbuttonwidget.dart';
import '../../widget/drawwidget.dart';
import '../../widget/globalmethod.dart';
import '../../widget/search_name_number_widget.dart';
import '../../widget/top_to_scan_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardDesignWidget(
                  widget: SizedBox(
                height: mq.height,
                width: mq.width,
                child: Column(
                  children: [
                    SearchNameNumberWidget(
                      title: 'To',
                      function: () {},
                    ),
                    GlobalMethod.dividerLine(),
                    const TopToScanWidget(
                      title: 'Tap To Scan QR Code',
                    ),
                    GlobalMethod.dividerLine(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Saved Payments",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w600),
                      ),
                    ),
                    GlobalMethod.dividerLine(),
                    const SizedBox(
                      height: 17,
                    ),
                    const Text(
                      "No Matching Payment",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
