import 'package:bkash_app_ui/const/const.dart';
import 'package:flutter/material.dart';

import '../../../globalcolor.dart';

class LastSectionWidget extends StatefulWidget {
  const LastSectionWidget({Key? key}) : super(key: key);

  @override
  State<LastSectionWidget> createState() => _LastSectionWidgetState();
}

class _LastSectionWidgetState extends State<LastSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mq.height * .42,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: grey),
            ),
            height: mq.height * .36,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/light_bulb.png'),
                  width: mq.width * .44,
                  height: mq.height * .1,
                ),
                const Text(
                  'Win Bike, TV,AC',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const Text('With Cashback in Every Minute'),
                SizedBox(
                  height: mq.height * .01,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    side: BorderSide(color: pink, width: 1), // Add border here
                  ),
                  onPressed: () {},
                  child: Text(
                    'Check Details',
                    style: TextStyle(color: pink),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
