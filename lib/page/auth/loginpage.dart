import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/approutes.dart';
import '../../const/const.dart';
import '../../globalcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int pinLength = 0;
  int phoneLenth = 0;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: white, statusBarIconBrightness: Brightness.dark));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mq.width * .044, vertical: mq.height * .012),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
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
                      ),
                      SizedBox(height: mq.height * .07),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildImage(
                            image: "assets/logo.png",
                          ),
                          _buildImage(
                            image: "assets/scanfile.png",
                          ),
                        ],
                      ),
                      SizedBox(height: mq.height * .02),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "to your bkash account",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 26,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(height: mq.height * .035),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Account Number",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                          ),
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  "+88",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Expanded(
                                flex: 9,
                                child: TextFormField(
                                  onChanged: (value) {
                                    phoneLenth = value.length;
                                    setState(() {});
                                  },
                                  maxLength: 11,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value!.length != 11) {
                                      return "Number must be 11 Digit ";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87),
                                  decoration: const InputDecoration(
                                      counterText: "",
                                      hintText: "Enter name or number",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                          _buildDivierLine(),
                        ],
                      ),
                      SizedBox(height: mq.height * .02),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "bKash PIN",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 9,
                                child: TextFormField(
                                  obscureText: true,
                                  maxLength: 6,
                                  onChanged: (value) {
                                    pinLength = value.length;
                                    setState(() {});
                                  },
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Bkash PIN Must Be Provide";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: pink),
                                  decoration: const InputDecoration(
                                      counterText: "",
                                      hintText: "Enter Your PIN Number",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                      border: InputBorder.none),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  color: white,
                                  child: Icon(
                                    Icons.fingerprint,
                                    color: pink,
                                    size: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                          _buildDivierLine(),
                        ],
                      ),
                      SizedBox(
                        height: mq.height * .02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppsRoutes.forgetPasswordPage);
                        },
                        child: Text(
                          "Forgot PIN? Try PIN Reset",
                          style: TextStyle(
                              color: pink,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
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
      decoration:
          BoxDecoration(color: pinLength > 3 && phoneLenth == 11 ? pink : grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Next",
            style: TextStyle(
                color: white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {
                if (pinLength > 3 && phoneLenth == 11) {
                  Navigator.pushReplacementNamed(context, AppsRoutes.mainPage);
                }
              },
              icon: Icon(
                Icons.arrow_forward,
                color: white,
              ))
        ],
      ),
    );
  }

  Divider _buildDivierLine() {
    return const Divider(
      height: .5,
      color: Colors.black12,
    );
  }

  Image _buildImage({required String image}) {
    return Image.asset(
      image,
      color: pink,
      height: mq.height * .06,
      width: mq.height * .06,
    );
  }
}
