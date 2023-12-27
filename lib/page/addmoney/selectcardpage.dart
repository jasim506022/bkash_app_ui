import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../widget/drawerbuttonwidget.dart';
import '../../widget/drawwidget.dart';
import '../../widget/globalmethod.dart';
import 'cardtobkash.dart';

class SelectCardPage extends StatefulWidget {
  const SelectCardPage({super.key});

  @override
  State<SelectCardPage> createState() => _SelectCardPageState();
}

class _SelectCardPageState extends State<SelectCardPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Card To Bkash",
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Select your Add Money source",
                              hintStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                              border: InputBorder.none),
                        ),
                      ),
                      GlobalMethod.dividerLine(),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: RowIconTitleWidget(
                            image: "assets/mastercard.png",
                            title: "MasterCard",
                          )),
                      GlobalMethod.dividerLine(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CardToBkash(),
                              ));
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: RowIconTitleWidget(
                              image: "assets/visa.png",
                              title: "VISA",
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
