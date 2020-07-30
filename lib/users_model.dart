class UserModel {
  UserModel({this.userId, this.id, this.title});

  final int userId;
  final int id;
  final String title;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
