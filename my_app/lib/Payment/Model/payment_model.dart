class PaymentModel {
  final String userId;
  final double totalPayment;
  final String date;
  final String time;
  final String paymentMethod;

  PaymentModel({
    required this.userId,
    required this.totalPayment,
    required this.date,
    required this.time,
    required this.paymentMethod,
  });
}
