class Userinfo {
  Userinfo({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.password,
    required this.userPhotoUrl,
  });

  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String birthday;
  final String gender;
  final String password;
  final String userPhotoUrl;

  factory Userinfo.fromMap(Map<String, dynamic> userData) {
    return Userinfo(
      name: userData["name"],
      lastName: userData["last_name"],
      email: userData["email"],
      phone: userData["phone"],
      birthday: userData["birthday"],
      gender: userData["gender"],
      password: userData["password"],
      userPhotoUrl: userData["user_photo_url"],
    );
  }
}
