class SigninReqParams {
  SigninReqParams({
    required this.emailOrNumber,
    required this.password,
  });
  final String emailOrNumber;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "email": emailOrNumber,
      "password": password,
    };
  }
}
