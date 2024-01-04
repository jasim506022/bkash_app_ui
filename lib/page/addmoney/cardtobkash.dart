import 'package:bkash_app_ui/page/addmoney/tabcard.dart';
import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/draw_widget.dart';

class CardToBkash extends StatefulWidget {
  const CardToBkash({super.key});

  @override
  State<CardToBkash> createState() => _CardToBkashState();
}

class _CardToBkashState extends State<CardToBkash>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Card to Bkash",
        ),
        actions: [DrawerButtonWidget(scaffoldKey: scaffoldKey)],
      ),
      endDrawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .033, vertical: mq.height * .012),
          child: SizedBox(
            height: mq.height,
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
                        child: TabBar(
                          indicatorColor: pink,
                          labelColor: pink,
                          unselectedLabelColor: grey,
                          labelStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                          controller: tabController,
                          tabs: [
                            SizedBox(
                              width: mq.width,
                              child: const Tab(
                                child: Text("My Account"),
                              ),
                            ),
                            SizedBox(
                              width: mq.width,
                              child: const Tab(
                                child: Text("Other Account"),
                              ),
                            ),
                          ],
                        ))),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: const [CardTab(), CardTab()],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
