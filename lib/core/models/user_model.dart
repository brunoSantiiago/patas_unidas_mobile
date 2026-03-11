import 'package:patas_unidas_mobile/core/domain/entities/user.dart';

class UserModel extends User {
  UserModel({super.id, required super.name, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}
