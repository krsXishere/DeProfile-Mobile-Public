class UserModel {
  int? id;
  String? name, email, image;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> object) {
    return UserModel(
      id: object['id'],
      name: object['name'],
      email: object['email'],
      image: object['image'],
    );
  }
}
