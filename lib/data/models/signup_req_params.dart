class SignupReqParams {
  SignupReqParams({
    required this.name,
    required this.emailOrNumber,
    required this.age,
    required this.gender,
    required this.password,
  });

  final String name;
  final String emailOrNumber;
  final String age;
  final String gender;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': emailOrNumber,
      'age': age,
      'gender': gender,
      'password': password,
    };
  }
}
