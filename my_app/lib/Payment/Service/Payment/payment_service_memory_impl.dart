import 'package:my_app/Payment/Model/payment_model.dart';
import 'package:my_app/Payment/Service/Payment/payment_service.dart';

class PaymentServiceMemoryImpl implements PaymentService {
  final List<PaymentModel> _payment = [
    PaymentModel(userId: "user02",totalPayment: 50, date: "1.20", time: "time", paymentMethod: "paymentMethod")
  ];
  
  @override
  Future<PaymentModel> addPayment(
      String totalPayment, String date, String time, String paymentMethod) {
    // TODO: implement addPayment
    throw UnimplementedError();
  }

  @override
  Future<PaymentModel> deletePayment(String userId) {
    // TODO: implement deletePayment
    throw UnimplementedError();
  }

  @override
  Future<PaymentModel> getAllPayment() {
    // TODO: implement getAllPayment
    throw UnimplementedError();
  }

  @override
  Future<PaymentModel> getPaymentByUserId(String userId) {
    // TODO: implement getPaymentByUserId
    throw UnimplementedError();
  }

  @override
  Future<PaymentModel> getPaymentTotal(String userId) {
    // TODO: implement getPaymentTotal
    throw UnimplementedError();
  }

  @override
  Future<PaymentModel> updatePayment(
      String totalPayment, String date, String time, String paymentMethod) {
    // TODO: implement updatePayment
    throw UnimplementedError();
  }
}
