class UserModel {
  final String imageUrl;
  final String name;
  final String email;
  final DateTime birthDate;
  final String gender;

  UserModel({
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.birthDate,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      imageUrl: json['imageUrl'],
      name: json['name'],
      email: json['email'],
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
    );
  }
}
