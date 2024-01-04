import '../const/approutes.dart';

class GovermentModel {
  String image;
  String title;
  String subtitle;

  GovermentModel(this.image, this.title, this.subtitle);
}

List<GovermentModel> govermentList = [
  GovermentModel(
      'assets/send_money.jpg', 'Send Money', AppsRoutes.sentmoneyPage),
  GovermentModel(
      'assets/mobile_recharge.jpg', 'Recharge', AppsRoutes.rechargePage),
  GovermentModel('assets/cash_out.jpg', 'Cash Out', AppsRoutes.cashOutPage),
  GovermentModel('assets/make_payment.jpg', 'Payment', AppsRoutes.paymentPage),
  GovermentModel('assets/add_money.jpg', 'Add Money', AppsRoutes.addMoneyPage),
  GovermentModel('assets/pay_bill.jpg', 'Pay Bill', AppsRoutes.payBill),
  GovermentModel('assets/savings.png', 'Savings', AppsRoutes.addMoneyPage),
  GovermentModel(
      'assets/loan-removebg-preview.png', 'Loan', AppsRoutes.addMoneyPage),
  GovermentModel('assets/bank_to_cash-removebg-preview.png', 'Remittance',
      AppsRoutes.addMoneyPage),
  GovermentModel('assets/bangla_qr-removebg-preview (1).png', 'Bangla QR',
      AppsRoutes.addMoneyPage),
];
