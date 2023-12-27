import 'package:flutter/material.dart';

import '../const/const.dart';
import '../globalcolor.dart';
import '../model/contractmodel.dart';
import '../model/itemmodel.dart';
import 'bottommodelwidget.dart';

class GlobalMethod {
  static Widget menuItem(String imagePath, String text) => Column(
        children: [
          Image.asset(
            imagePath,
            height: mq.height * .062,
          ),
          FittedBox(
            child: Text(
              text,
              style: const TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ),
        ],
      );

  static Divider dividerLine() {
    return const Divider(
      color: Colors.black12,
    );
  }

  static Container lineRow(
      {required Widget widget,
      bool top = false,
      bool bottom = false,
      bool left = false,
      bool right = false}) {
    return Container(
        height: mq.height * .09,
        padding: EdgeInsets.only(left: mq.width * .066),
        decoration: BoxDecoration(
            border: Border(
          top: top ? const BorderSide(color: Colors.black12) : BorderSide.none,
          bottom: bottom
              ? const BorderSide(color: Colors.black12)
              : BorderSide.none,
          left:
              left ? const BorderSide(color: Colors.black12) : BorderSide.none,
          right:
              right ? const BorderSide(color: Colors.black12) : BorderSide.none,
        )),
        child: widget);
  }

  static Container gridViewHorizontalDirector({required List<ItemModel> list}) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: grey),
      ),
      height: mq.height * .1,
      width: mq.width,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, list[index].pushName);
            },
            child: Container(
              child:
                  GlobalMethod.menuItem(list[index].image, list[index].title),
            ),
          );
        },
        itemCount: myBikashWidgetList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 15,
          crossAxisSpacing: 5,
        ),
      ),
    );
  }

  static SliverGridDelegateWithFixedCrossAxisCount
      silverGRidDelegratWtihFixedCrossAxisCountMethod() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      mainAxisSpacing: mq.width * .08,
      crossAxisSpacing: mq.width * .1,
    );
  }

  static Container homePageRowWidget(
      {required BuildContext context,
      required String title,
      required List<ItemModel> list}) {
    return Container(
      padding: EdgeInsets.all(mq.width * .02),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black54),
          ),
          GestureDetector(
            onTap: () {
              showBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  backgroundColor: white,
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return BottomModelWidget(
                      list: list,
                      title: title,
                    );
                  });
            },
            child: Text(
              'See All',
              style: TextStyle(color: pink, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  static buildRowNumber(
      {required ContractModel contractModel, Function? function}) {
    return InkWell(
      onTap: () {
        function!();
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/sentmoney/global_avatar.png",
                  height: mq.height * .071,
                  width: mq.height * .071,
                ),
                SizedBox(
                  width: mq.width * .044,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contractModel.name,
                      style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: mq.width * .005,
                    ),
                    Text(
                      contractModel.number,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                          fontSize: 13),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Text(
              "Remove",
              style: TextStyle(
                  color: pink, fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RowIconTitleWidget extends StatelessWidget {
  RowIconTitleWidget(
      {super.key,
      required this.image,
      required this.title,
      this.isColor = false});
  final String image;
  final String title;
  bool? isColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isColor!
            ? Image.asset(
                image,
                height: mq.height * .048,
                width: mq.height * .048,
                color: pink,
              )
            : Image.asset(
                image,
                height: mq.height * .048,
                width: mq.height * .048,
              ),
        SizedBox(
          width: mq.width * .022,
        ),
        Text(
          title,
          style: TextStyle(color: pink, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
