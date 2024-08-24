class VisaModel {
  String fullName = "";
  String address = "";
  String city = "";
  String country = ""; 
  String cardNumber = "";
  String expirationDate = "";
  String cvv = "";

  VisaModel(
    {
      required fullname,
      required address, 
      required city, 
      required country, 
      required cardNumber, 
      required expirationDate, 
      required cvv
    }
  );
}
