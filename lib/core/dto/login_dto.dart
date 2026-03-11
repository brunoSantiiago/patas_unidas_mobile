class LoginDTO {
  final String email;
  final String password;

  LoginDTO({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
