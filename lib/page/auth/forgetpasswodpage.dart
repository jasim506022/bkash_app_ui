import 'package:bkash_app_ui/const/approutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  int pinLength = 0;
  int phoneLenth = 0;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xffF7F7F7),
        statusBarIconBrightness: Brightness.dark));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF7F7F7),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: pink,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: mq.width * .033,
                            vertical: mq.height * .011),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(mq.height * .03),
                            border: Border.all(
                              color: pink,
                            )),
                        child: Text(
                          "বাংলা",
                          style: TextStyle(
                              color: pink,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/forgetpage.png",
                    height: mq.height * .45,
                    width: mq.width,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forget your bKash PIN?",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'You can easily resent your pin from the bKash App if your account is registered with your NID. To get started, please tap on the "Reset Pin" button below and follow the steps mentioned . Please keep SIM card registered with bKash account in this Phone.\n\n If your account was opened with any other ID except NID, please dial *247# and select the "Reset PIN" option to reset your PIN.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            __buildNextButton()
          ],
        ),
      ),
    );
  }

  Container __buildNextButton() {
    return Container(
      height: mq.height * .06,
      width: mq.width,
      padding: EdgeInsets.symmetric(horizontal: mq.width * .044),
      decoration: BoxDecoration(color: pink),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Reset PIN",
            style: TextStyle(
                color: white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppsRoutes.loginPage);
              },
              icon: Icon(
                Icons.arrow_forward,
                color: white,
              ))
        ],
      ),
    );
  }
}
