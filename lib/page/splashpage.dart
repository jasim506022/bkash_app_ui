import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/approutes.dart';
import '../const/const.dart';
import '../globalcolor.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive,
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppsRoutes.loginPage);
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: pink),
        child: Center(
          child: Image(
            image: const AssetImage('assets/logo.png'),
            width: mq.width * .3,
          ),
        ),
      ),
    );
  }
}
