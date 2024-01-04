import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../globalcolor.dart';
import '../../../model/offers_card_model.dart';

class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({
    super.key,
    required this.offersModel,
  });
  final OffersModel offersModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      child: Column(
        children: [
          Image(
            image: AssetImage(offersModel.imgUrl),
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
                SizedBox(
                  height: mq.height * .004,
                ),
                Text(
                  offersModel.titleOne,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: mq.height * .002,
                ),
                Text(
                  offersModel.titleTwo,
                  style: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
