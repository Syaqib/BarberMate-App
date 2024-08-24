import 'package:my_app/Payment/Model/payment_model.dart';

abstract class PaymentService {
  Future<PaymentModel> getPaymentTotal(String userId); 
  Future<PaymentModel> getAllPayment(); 
  Future<PaymentModel> addPayment(String totalPayment, String date, String time, String paymentMethod); 
  Future<PaymentModel> deletePayment(String userId); 
  Future<PaymentModel> updatePayment(String totalPayment, String date, String time, String paymentMethod); 
  Future<PaymentModel> getPaymentByUserId(String userId); 
}
