class User {
  final String mixed;
  final String password;

  User({required this.mixed, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'mixed': mixed,
      'password': password,
    };
  }
}
