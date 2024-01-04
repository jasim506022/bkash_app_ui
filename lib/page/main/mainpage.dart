import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../home/homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      navBarBackgroundColor: white,
      activeColor: pink,
      inActiveColor: Colors.black45,
      actionButton: CurvedActionBar(
        onTab: (value) {
          if (kDebugMode) {
            print("Bangladesh");
          }
        },
        activeIcon: _buildActionBarIcon(),
        inActiveIcon: _buildActionBarIcon(),
        text: "Scan QR",
      ),
      appBarItems: [
        _buildFABBottomAppBarItem(icon: Icons.home, text: 'Home'),
        _buildFABBottomAppBarItem(icon: Icons.insert_comment, text: 'Inbox'),
      ],
      bodyItems: [
        const HomePage(),
        Container(
          height: mq.height,
          color: pink,
        )
      ],
      actionBarView: Container(
        height: mq.height,
        color: orange,
      ),
    );
  }

  FABBottomAppBarItem _buildFABBottomAppBarItem(
      {required IconData icon, required String text}) {
    return FABBottomAppBarItem(
        activeIcon: Icon(
          icon,
          size: 35,
          color: pink,
        ),
        inActiveIcon: Icon(
          icon,
          size: 35,
          color: Colors.black26,
        ),
        text: text);
  }

  Container _buildActionBarIcon() {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(3),
      decoration:
          BoxDecoration(color: white, shape: BoxShape.circle, boxShadow: const [
        BoxShadow(
            color: Colors.black12, blurRadius: .5, blurStyle: BlurStyle.inner),
      ]),
      child: Icon(
        Icons.document_scanner_outlined,
        size: 45,
        color: pink,
      ),
    );
  }
}
