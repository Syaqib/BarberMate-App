class RegistrationModel {
  String fullName = '';
  String idOrPassportCard = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String userType = '';

  RegistrationModel(this.fullName, this.idOrPassportCard, this.phoneNumber,
      this.email, this.password, this.confirmPassword, this.userType) {}
}
