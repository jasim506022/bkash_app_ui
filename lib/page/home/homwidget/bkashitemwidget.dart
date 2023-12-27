import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../const/const.dart';
import '../../../globalcolor.dart';
import '../../../model/itemmodel.dart';
import '../../../widget/globalmethod.dart';

class BkashItemWidget extends StatefulWidget {
  const BkashItemWidget({super.key});

  @override
  State<BkashItemWidget> createState() => _BkashItemWidgetState();
}

class _BkashItemWidgetState extends State<BkashItemWidget> {
  bool isExpanded = false;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void showLoadingAnimation(BuildContext context, String pushName) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: Center(
            child: Container(
                color: white,
                child: const Image(
                    image: AssetImage(
                  'assets/loading.gif',
                ))),
          ),
        );
      },
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.pop(context);

      Navigator.pushNamed(context, pushName);
    });
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = isExpanded ? mq.height * .425 : mq.height * .28;
    return 
    
    Container(
      height: containerHeight,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          color: white,
        ),
        child: Stack(
          children: [
            InkWell(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    mq.width * .022, mq.height * .022, mq.width * .018, 0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showLoadingAnimation(
                            context, bkashitem[index].pushName);
                      },
                      child: Container(
                        child: GlobalMethod.menuItem(
                            bkashitem[index].image, bkashitem[index].title),
                      ),
                    );
                  },
                  itemCount: bkashitem.length,
                  gridDelegate: GlobalMethod
                      .silverGRidDelegratWtihFixedCrossAxisCountMethod(),
                ),
              ),
            ),
            Positioned(
              top: isExpanded ? mq.height * .365 : mq.height * .225,
              right: mq.width * .35,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2, 6),
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 96,
                        spreadRadius: 3),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    elevation: 3,
                  ),
                  onPressed: toggleExpansion,
                  child: Row(
                    children: [
                      Text(
                        isExpanded ? 'Close' : 'See More',
                        style: TextStyle(
                            color: pink,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                      Icon(
                        isExpanded
                            ? FontAwesomeIcons.angleUp
                            : FontAwesomeIcons.angleDown,
                        color: pink,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
 
  }
}
