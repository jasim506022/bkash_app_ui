import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../globalcolor.dart';
import '../../../model/offers_card_model.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Offers',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: pink, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            width: mq.width,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: grey),
            ),
            height: mq.height * .33,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: offersModel.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      color: white,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(offersModel[index].imgUrl),
                            width: mq.width * .44,
                            height: mq.height * .22,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: mq.width * .4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  offersModel[index].titleOne,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  offersModel[index].titleTwo,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
