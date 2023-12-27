import 'package:flutter/material.dart';

import '../const/const.dart';

class DrawerButtonWidget extends StatelessWidget {
  const DrawerButtonWidget({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: mq.height * .014, right: mq.height * .014),
      child: InkWell(
        onTap: () {
          scaffoldKey.currentState!.openDrawer();
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.closeEndDrawer();
          } else {
            scaffoldKey.currentState!.openEndDrawer();
          }
        },
        child: SizedBox(
            width: mq.width * .076,
            height: mq.width * .076,
            child: Image.asset('assets/logo.png')),
      ),
    );
  }
}
