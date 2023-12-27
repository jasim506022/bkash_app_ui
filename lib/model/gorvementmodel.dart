import '../const/approutes.dart';

class ItemModel {
  String image;
  String title;
  String subtitle;

  ItemModel(this.image, this.title, this.subtitle);
}

List<ItemModel> govermentList = [
  ItemModel('assets/send_money.jpg', 'Send Money', AppsRoutes.sentmoneyPage),
  ItemModel('assets/mobile_recharge.jpg', 'Recharge', AppsRoutes.rechargePage),
  ItemModel('assets/cash_out.jpg', 'Cash Out', AppsRoutes.cashOutPage),
  ItemModel('assets/make_payment.jpg', 'Payment', AppsRoutes.paymentPage),
  ItemModel('assets/add_money.jpg', 'Add Money', AppsRoutes.addMoneyPage),
  ItemModel('assets/pay_bill.jpg', 'Pay Bill', AppsRoutes.payBill),
  ItemModel('assets/savings.png', 'Savings', AppsRoutes.addMoneyPage),
  ItemModel(
      'assets/loan-removebg-preview.png', 'Loan', AppsRoutes.addMoneyPage),
  ItemModel('assets/bank_to_cash-removebg-preview.png', 'Remittance',
      AppsRoutes.addMoneyPage),
  ItemModel('assets/bangla_qr-removebg-preview (1).png', 'Bangla QR',
      AppsRoutes.addMoneyPage),
];
