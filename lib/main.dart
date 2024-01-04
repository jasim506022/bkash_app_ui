import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const/approutes.dart';
import 'const/const.dart';
import 'globalcolor.dart';
import 'page/addmoney/addmoneypage.dart';
import 'page/auth/forgetpasswodpage.dart';
import 'page/auth/loginpage.dart';
import 'page/cashout/cashoutpage.dart';
import 'page/main/mainpage.dart';
import 'page/pay/paybillpage.dart';
import 'page/payment/payment.dart';
import 'page/profile/profilepage.dart';
import 'page/recharge/rechargepage.dart';
import 'page/sentmoney/sentmoneypage.dart';
import 'page/splashpage.dart';
import 'service/provider/balanceanimationprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BalanceAnimationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: pink,
            iconTheme: IconThemeData(color: white),
            titleTextStyle: TextStyle(
                color: white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          scaffoldBackgroundColor: backgroundColor,
          useMaterial3: true,
        ),
        initialRoute: AppsRoutes.splashPage,
        routes: {
          AppsRoutes.loginPage: (_) => const LoginPage(),
          AppsRoutes.forgetPasswordPage: (_) => const ForgetPasswordPage(),
          AppsRoutes.splashPage: (_) => const SplashPage(),
          AppsRoutes.mainPage: (_) => const MainPage(),
          AppsRoutes.addMoneyPage: (_) => const AddMoneyPage(),
          AppsRoutes.sentmoneyPage: (_) => const SentMoneyPage(),
          AppsRoutes.rechargePage: (_) => const RechargePage(),
          AppsRoutes.cashOutPage: (_) => const CashOutPage(),
          AppsRoutes.paymentPage: (_) => const PaymentPage(),
          AppsRoutes.payBill: (_) => const PayBillPage(),
          AppsRoutes.profilePage: (_) => const ProfilePage(),
        },
      ),
    );
  }
}
