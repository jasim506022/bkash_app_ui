import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../model/itemmodel.dart';
import '../../../widget/globalmethod.dart';
import '../../../widget/home_page_row_widget.dart';

class MoreSectionWidtget extends StatefulWidget {
  const MoreSectionWidtget({Key? key}) : super(key: key);

  @override
  State<MoreSectionWidtget> createState() => _MoreSectionWidtgetState();
}

class _MoreSectionWidtgetState extends State<MoreSectionWidtget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(mq.width * .024),
          child: HomePageRowWidget(
            itemModel: moreService,
            title: 'More Services',
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          height: mq.height * .22,
          padding: EdgeInsets.fromLTRB(mq.width * .022, 0, mq.width * .018, 0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  child: GlobalMethod.menuItem(
                      moreService[index].image, moreService[index].title),
                ),
              );
            },
            itemCount: moreService.length,
            gridDelegate:
                GlobalMethod.silverGRidDelegratWtihFixedCrossAxisCountMethod(),
          ),
        ),
      ],
    );
  }
}
