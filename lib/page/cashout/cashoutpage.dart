import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/draw_widget.dart';
import 'agentab.dart';

class CashOutPage extends StatefulWidget {
  const CashOutPage({super.key});

  @override
  State<CashOutPage> createState() => _CashOutPageState();
}

class _CashOutPageState extends State<CashOutPage>
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
          "Cash Out Page",
        ),
        actions: [DrawerButtonWidget(scaffoldKey: scaffoldKey)],
      ),
      endDrawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .033, vertical: mq.height * .018),
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
                          tabs: const [
                            TabSizeWidget(
                              icon: Icons.home,
                              text: "Agent",
                            ),
                            TabSizeWidget(
                              icon: Icons.atm_rounded,
                              text: "ATM",
                            ),
                          ],
                        ))),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: const [AgentTabPage(), AgentTabPage()],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabSizeWidget extends StatelessWidget {
  const TabSizeWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mq.height * .071,
      width: mq.width,
      child: Tab(
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 7,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
