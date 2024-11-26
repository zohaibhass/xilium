class UserModel {
  final String firstName;
  final String surName;
  final String userName;
  final String address;
  final String telephone;
  final String email;
  final String password;
  final String confirmPassword;
  bool termsAccepted=false;

  UserModel(
      {required this.firstName,
      required this.surName,
      required this.userName,
      required this.address,
      required this.email,
      required this.telephone,
      required this.password,
      required this.confirmPassword,
      required this.termsAccepted});

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "surname": surName,
      "user_name": userName,
      "address": address,
      "telephone": telephone,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
      "terms_accepted": termsAccepted,
    };
  }
}
