import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/draw_widget.dart';
import '../../widget/globalmethod.dart';
import '../../widget/row_icon_title_widget.dart';
import 'selectcardpage.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({super.key});

  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Add Money",
        ),
        actions: [DrawerButtonWidget(scaffoldKey: scaffoldKey)],
      ),
      endDrawer: const DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .044, vertical: mq.height * .012),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(vertical: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: white,
                child: Container(
                  color: white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: mq.height * .016,
                            horizontal: mq.width * .033),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Select your Add Money ",
                              hintStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                              border: InputBorder.none),
                        ),
                      ),
                      GlobalMethod.dividerLine(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: pink)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/bank_icon.png",
                                  height: mq.height * .035,
                                  width: mq.height * .035,
                                  color: pink,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: mq.width * .022,
                            ),
                            Text(
                              "Bank to Bkash",
                              style: TextStyle(
                                  color: pink, fontWeight: FontWeight.w700),
                            ),
                          ]),
                      GlobalMethod.dividerLine(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectCardPage(),
                              ));
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mq.width * .022,
                                vertical: mq.height * .012),
                            child: const RowIconTitleWidget(
                              isColor: true,
                              image: "assets/card.png",
                              title: "Card to Bkash",
                            )),
                      ),
                    ],
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
