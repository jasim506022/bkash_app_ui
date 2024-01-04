import 'package:bkash_app_ui/const/approutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../../globalcolor.dart';
import '../../service/provider/balanceanimationprovider.dart';
import '../../widget/draw_widget.dart';
import 'homwidget/banner_widget.dart';
import 'homwidget/big_banner_widget.dart';
import 'homwidget/bkash_item_widget.dart';
import 'homwidget/last_section.dart';
import 'homwidget/more_section_widget.dart';
import 'homwidget/my_bkash_widget.dart';
import 'homwidget/offeres_widget.dart';
import 'homwidget/suggestion_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<_HomePageState> appBarkey = GlobalKey<_HomePageState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            shape: CurvedAppBarShape(),
            toolbarHeight: mq.height * .094,
            backgroundColor: pink,
            key: appBarkey,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppsRoutes.profilePage);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: mq.height * .006,
                            left: mq.width * .027,
                            bottom: mq.height * .005),
                        child: CircleAvatar(
                          radius: mq.width * .063,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const AssetImage('assets/jasim.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(width: mq.width * .022),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' Md Jasim Uddin',
                          style: TextStyle(
                              fontSize: 14,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: mq.height * .006,
                        ),
                        Consumer<BalanceAnimationProvider>(
                          builder: (context, animationProvider, child) {
                            return InkWell(
                              onTap: () async {
                                animationProvider.setbalance(balance: false);
                                animationProvider.setAnimation(animation: true);

                                await Future.delayed(
                                  const Duration(milliseconds: 800),
                                  () {
                                    animationProvider.setBalanceShown(
                                        balanceShown: true);
                                  },
                                );
                                await Future.delayed(
                                  const Duration(seconds: 3),
                                  () {
                                    animationProvider.setBalanceShown(
                                        balanceShown: false);
                                  },
                                );
                                await Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () {
                                    animationProvider.setAnimation(
                                        animation: false);
                                  },
                                );

                                await Future.delayed(
                                  const Duration(milliseconds: 800),
                                  () {
                                    setState(() {
                                      animationProvider.setbalance(
                                          balance: true);
                                    });
                                  },
                                );
                              },
                              child: Container(
                                height: mq.height * .035,
                                width: mq.width * .33,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius:
                                      BorderRadius.circular(mq.height * .035),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      opacity: animationProvider.isBalanceShown
                                          ? 1
                                          : 0,
                                      child: Text('৳ 8100.25',
                                          style: TextStyle(
                                              color: pink,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      opacity:
                                          animationProvider.isBalance ? 1 : 0,
                                      child: Text('Tap for balance',
                                          style: TextStyle(
                                              color: pink,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w800)),
                                    ),
                                    AnimatedPositioned(
                                      duration:
                                          const Duration(milliseconds: 1100),
                                      curve: Curves.fastOutSlowIn,
                                      left:
                                          animationProvider.isAnimation == false
                                              ? mq.width * .012
                                              : mq.width * .28,
                                      child: Container(
                                          height: mq.width * .044,
                                          width: mq.width * .044,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: pink,
                                              shape: BoxShape.circle),
                                          child: FittedBox(
                                              child: Text('৳',
                                                  style: TextStyle(
                                                      color: white,
                                                      fontSize: 17)))),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              _buildAction('assets/rewards.png'),
              _buildAction('assets/logo.png', onTap: () {
                scaffoldKey.currentState!.openDrawer();
                scaffoldKey.currentState!.isDrawerOpen
                    ? scaffoldKey.currentState!.closeEndDrawer()
                    : scaffoldKey.currentState!.openEndDrawer();
              }),
            ]),
        body: ListView(
          children: const [
            BkashItemWidget(),
            MyBkashWidget(),
            BannerWidget(),
            SuggestionWidget(),
            OffersWidget(),
            MoreSectionWidtget(),
            BigBannerWidget(),
            LastSectionWidget(),
          ],
        ),
        endDrawer: const DrawerWidget());
  }
}

Widget _buildAction(String assetPath, {VoidCallback? onTap}) {
  return Padding(
    padding: EdgeInsets.only(top: mq.height * .0141, right: mq.width * .026),
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        width: mq.width * .076,
        height: mq.width * .076,
        child: Image.asset(assetPath),
      ),
    ),
  );
}

class CurvedAppBarShape extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(rect.left, rect.bottom - 20) // Curve starts here
      ..quadraticBezierTo(rect.left, rect.bottom, rect.left + 20, rect.bottom)
      ..lineTo(rect.right - 20, rect.bottom)
      ..quadraticBezierTo(rect.right, rect.bottom, rect.right, rect.bottom - 20)
      ..lineTo(rect.right, rect.top)
      ..close();
    return path;
  }
}
