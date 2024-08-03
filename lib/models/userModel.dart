class UserModel {
  String password;
  String image;
  String email;
  DateTime date;
  bool isAdmin;
  String fullName;
  String description;

  UserModel({
    required this.password,
    required this.image,
    required this.email,
    required this.date,
    required this.isAdmin,
    required this.fullName,
    required this.description,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      password: json['password'],
      image: json['image'],
      email: json['email'],
      date: DateTime.fromMicrosecondsSinceEpoch(json['date']),
      isAdmin: json['isAdmin'],
      fullName: json['fullName'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'image': image,
      'email': email,
      'date': date.microsecondsSinceEpoch,
      'isAdmin': isAdmin,
      'fullName': fullName,
      'description': description,
    };
  }
}
