class LoginModel {
  final String name;
  final String email;
  final int userId;

  LoginModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        userId = json['userId'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'email': email,
        'userId': userId,
      };
}