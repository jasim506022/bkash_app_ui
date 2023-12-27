class OffersModel {
  final int oid;
  final String imgUrl;
  final String titleOne;
  final String titleTwo;
  final String notifyImg;
  final String notifyImg2;
  final String notifyTitleOne;
  final String notifyTitleTwo;

  OffersModel({
    required this.oid,
    required this.imgUrl,
    required this.titleOne,
    required this.titleTwo,
    required this.notifyImg,
    required this.notifyImg2,
    required this.notifyTitleOne,
    required this.notifyTitleTwo,
  });

  OffersModel copyWith({
    int? oid,
    String? imgUrl,
    String? titleOne,
    String? titleTwo,
    String? notifyImg,
    String? notifyImg2,
    String? notifyTitleOne,
    String? notifyTitleTwo,
  }) {
    return OffersModel(
      oid: oid ?? this.oid,
      imgUrl: imgUrl ?? this.imgUrl,
      titleOne: titleOne ?? this.titleOne,
      titleTwo: titleTwo ?? this.titleTwo,
      notifyImg: notifyImg ?? this.notifyImg,
      notifyImg2: notifyImg2 ?? this.notifyImg2,
      notifyTitleOne: notifyTitleOne ?? this.notifyTitleOne,
      notifyTitleTwo: notifyTitleTwo ?? this.notifyTitleTwo,
    );
  }
}


List<OffersModel> offersModel = [
 
  OffersModel(
    oid: 1,
    imgUrl: 'assets/offer/akash.jpg',
    titleOne: 'BDT 900 Discount',
    titleTwo: 'Akash DTH',
    notifyTitleTwo:
        'Get Instance 30 tk Cashback on \nAdd Money from your Card to Bkash',
    notifyTitleOne: 'Super Offer on Add Money',
    notifyImg2: 'assets/main icon.png',
    notifyImg: 'assets/cashback_offer.jpg',
  ),
  OffersModel(
    oid: 2,
    imgUrl: 'assets/bkash_panda.jpg',
    titleOne: 'Payment Your Bill',
    titleTwo: 'BDT 200 Gift',
    notifyTitleTwo:
        'Get Instance 30 tk Cashback on \nAdd Money from your Card to Bkash',
    notifyTitleOne: 'Super Offer on Add Money',
    notifyImg2: 'assets/main icon.png',
    notifyImg: 'assets/cashback_offer.jpg',
  ),

 OffersModel(
    oid: 3,
    imgUrl: 'assets/offer/rechargebkash.jpg',
    titleOne: 'Robi',
    titleTwo: 'Nonstop CashBack',
    notifyTitleTwo:
        'Get Instance 30 tk Cashback on \nAdd Money from your Card to Bkash',
    notifyTitleOne: 'Super Offer on Add Money',
    notifyImg2: 'assets/main icon.png',
    notifyImg: 'assets/cashback_offer.jpg',
  ),

  OffersModel(
    oid: 4,
    imgUrl: 'assets/bkash_empy.jpg',
    titleOne: 'BDT 400 Cashback',
    titleTwo: 'Daraz',
    notifyTitleTwo:
        'Get 16 Tk cashback on Performing for \n11 Tk Top-Upfrom app.only Once!',
    notifyTitleOne: "Hurrah! It's a Time to Top-Up",
    notifyImg2: 'assets/main icon.png',
    notifyImg: 'assets/recharge_offer.png',
  ),
  OffersModel(
    oid: 5,
    imgUrl: 'assets/bkash_panda.jpg',
    titleOne: 'BDT 200 Discount',
    titleTwo: 'Akash DTH',
    notifyTitleTwo: '',
    notifyTitleOne: '',
    notifyImg2: 'assets/main icon.png',
    notifyImg: '',
  )
];

