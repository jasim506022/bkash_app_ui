import 'package:bkash_app_ui/const/approutes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';
import '../globalcolor.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: white,
        child: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              SizedBox(
                height: mq.height * .155,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(mq.width * .02, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bkash Menu',
                          style: TextStyle(
                            color: pink,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: mq.width * .04,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: white,
                              side: BorderSide(color: pink, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            child: Text(
                              'বাংলা',
                              style: TextStyle(
                                  color: pink, fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              _listTitleItemWidget(
                context: context,
                image: 'assets/home.png',
                title: 'Home',
                function: () {
                  Navigator.pushNamed(context, AppsRoutes.mainPage);
                },
              ),
              _listTitleItemWidget(
                  function: () {
                    if (kDebugMode) {
                      print("Heome");
                    }
                  },
                  context: context,
                  image: 'assets/bar-graph.png',
                  title: 'Statement'),
              _listTitleItemWidget(
                  function: () {
                    if (kDebugMode) {
                      print("Heome");
                    }
                  },
                  context: context,
                  image: 'assets/alert_icon.png',
                  title: 'Limits'),
              _listTitleItemWidget(
                  function: () {
                    if (kDebugMode) {
                      print("Heome");
                    }
                  },
                  context: context,
                  image: 'assets/coupon.png',
                  title: 'Cupones'),
              _listTitleItemWidget(
                  function: () {
                    if (kDebugMode) {
                      print("Heome");
                    }
                  },
                  context: context,
                  image: 'assets/update_process_two.png',
                  title: 'Nominee Update'),
              _listTitleItemWidget(
                  function: () {
                    if (kDebugMode) {
                      print("Heome");
                    }
                  },
                  context: context,
                  image: 'assets/refer_a_friend.png',
                  title: 'Refer bkash App'),
              _listTitleItemWidget(
                  function: () {
                    if (kDebugMode) {
                      print("Heome");
                    }
                  },
                  context: context,
                  image: 'assets/location.png',
                  title: 'Bkash Map'),
              _listTitleItemWidget(
                  function: () {
                    if (kDebugMode) {
                      print("Heome");
                    }
                  },
                  context: context,
                  image: 'assets/discover.png',
                  title: 'Discover bkash'),
              _listTitleItemWidget(
                  function: () {
                    if (kDebugMode) {
                      print("Heome");
                    }
                  },
                  context: context,
                  image: 'assets/settings.png',
                  title: 'Settings'),
              _listTitleItemWidget(
                  context: context,
                  function: () {
                    if (kDebugMode) {
                      print("Heome");
                    }
                  },
                  image: 'assets/support.png',
                  title: 'Support'),
              _listTitleItemWidget(
                  function: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppsRoutes.loginPage,
                      (route) => false,
                    );
                  },
                  context: context,
                  image: 'assets/log_out.png',
                  title: 'Logout'),
            ],
          ),
        ),
      ),
    );
  }

  Container _listTitleItemWidget(
      {required BuildContext context,
      required String image,
      required String title,
      required Function function}) {
    return Container(
      color: white,
      child: Column(
        children: [
          ListTile(
            leading: Image(
              image: AssetImage(image),
              color: pink,
              width: mq.width * .06,
            ),
            title: Text(
              title,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            onTap: () {
              function();
            },
          ),
          Divider(
            color: grey,
            thickness: 0.2,
            indent: 5,
            endIndent: 2,
          ),
        ],
      ),
    );
  }
}
