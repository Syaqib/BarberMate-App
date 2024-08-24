import 'package:map_mvvm/view/viewmodel.dart';

class PaymentViewModel extends Viewmodel {
  String paymentType = "default";
  String date = "default";
  void setPaymentTypeValue(String paymentTypeUser) {
    paymentType = paymentTypeUser;
  }
}
