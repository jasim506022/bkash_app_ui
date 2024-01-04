import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../../globalcolor.dart';
import '../../../model/offers_card_model.dart';
import 'offer_card_widget.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: mq.width,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: grey),
            ),
            child: const Text(
              'Offers',
              style: TextStyle(fontWeight: FontWeight.w500),
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
                    return OfferCardWidget(
                      offersModel: offersModel[index],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
