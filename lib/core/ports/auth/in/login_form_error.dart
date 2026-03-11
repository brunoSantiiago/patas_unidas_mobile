class LoginFormError {
  final String? email;
  final String? password;

  const LoginFormError({
    this.email,
    this.password,
  });

  bool get hasError => email != null || password != null;

  static const empty = LoginFormError();
}
