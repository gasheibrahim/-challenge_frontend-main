class SignupModel {
  final String name;

  final String email;

  final String password;

  const SignupModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}
