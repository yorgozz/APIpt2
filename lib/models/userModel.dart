class UserModel {
  String email;
  String password;
  String firstName;
  String lastName;
  bool isLoggedIn;

  UserModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.isLoggedIn = false,
  });
}
