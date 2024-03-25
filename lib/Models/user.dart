class UserModel {
  String? name;
  String? age;
  String? phonenuber;

  UserModel({this.name, this.age, this.phonenuber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], age: json['age'], phonenuber: json['phonenuber']);

  }
}