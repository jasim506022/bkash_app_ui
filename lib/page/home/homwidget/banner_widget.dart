import 'dart:async';

import 'package:bkash_app_ui/globalcolor.dart';
import 'package:flutter/material.dart';

import '../../../const/const.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final _pageController = PageController(viewportFraction: 1, initialPage: 1);

  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Timer? _timer;

  void startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage == assetImages.length - 1) {
        currentPage = 0;
      } else {
        currentPage++;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mq.height * .177,
          child: PageView.builder(
              controller: _pageController,
              itemCount: assetImages.length,
              onPageChanged: (page) => setState(() => currentPage = page),
              itemBuilder: (context, pagePosition) {
                return Container(
                    margin: const EdgeInsets.all(5),
                    child: Image.asset(
                      assetImages[pagePosition],
                      fit: BoxFit.cover,
                    ));
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              assetImages.length,
              (index) => Container(
                    margin: const EdgeInsets.all(1.0),
                    width: 10.0,
                    child: Icon(
                      Icons.circle_rounded,
                      size: 10,
                      color: currentPage == index ? pink : Colors.grey.shade400,
                    ),
                  )),
        ),
      ],
    );
  }
}
