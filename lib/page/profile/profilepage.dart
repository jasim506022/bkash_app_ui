import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../widget/draw_widget.dart';
import '../../widget/drawer_button_widget.dart';
import '../../widget/globalmethod.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Profile",
        ),
        actions: [DrawerButtonWidget(scaffoldKey: scaffoldKey)],
      ),
      endDrawer: const DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .033, vertical: mq.width * .02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mq.height * .35,
                width: mq.width,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        height: mq.height * .25,
                        width: mq.height * .25,
                        decoration: BoxDecoration(
                            color: pink.withOpacity(.1),
                            shape: BoxShape.circle),
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                height: mq.height * .2,
                                width: mq.height * .2,
                                decoration: BoxDecoration(
                                    color: pink.withOpacity(.4),
                                    shape: BoxShape.circle),
                              ),
                              Positioned(
                                top: mq.height * .025,
                                left: mq.height * .025,
                                child: Container(
                                  height: mq.height * .15,
                                  width: mq.height * .15,
                                  decoration: BoxDecoration(
                                      color: pink.withOpacity(.7),
                                      image: const DecorationImage(
                                          image:
                                              AssetImage("assets/jasim.jpg")),
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Md Jasim Uddin",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: mq.width * .05,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border.all(color: Colors.green, width: 4)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GlobalMethod.dividerLine(),
              _buildProfileListTile(
                  image: "assets/user_name.png",
                  text: 'Change Name',
                  isColor: false),
              _buildProfileListTile(
                  image: "assets/code.png", text: 'My QR', isColor: false),
              _buildProfileListTile(
                  image: "assets/card.png", text: 'Save Card', isColor: false),
              _buildProfileListTile(
                  image: "assets/sentmoney/auto_instalment_deduction.png",
                  text: 'Information'),
              _buildProfileListTile(
                  image: "assets/sentmoney/typesentmoney/fnf.png",
                  text: 'Nominee Update'),
              _buildProfileListTile(
                  image: "assets/fingerprint.png",
                  text: 'Enable Touch/Face Id',
                  isColor: false),
              GlobalMethod.dividerLine(),
            ],
          ),
        ),
      ),
    );
  }

  _buildProfileListTile(
      {required String image, required String text, bool isColor = true}) {
    return Column(
      children: [
        ListTile(
          leading: isColor
              ? Image.asset(
                  image,
                  height: 40,
                  width: 60,
                )
              : Image.asset(
                  image,
                  color: pink,
                  height: 40,
                  width: 60,
                ),
          title: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.black87),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black54,
          ),
        ),
        GlobalMethod.dividerLine(),
      ],
    );
  }
}
