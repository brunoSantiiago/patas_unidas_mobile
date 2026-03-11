import 'package:patas_unidas_mobile/core/domain/entities/user.dart';

class LoadUserDTO extends User {
  LoadUserDTO({required int id, required String name, required String email})
    : super(id: id, name: name, email: email);

  factory LoadUserDTO.fromJson(Map<String, dynamic> json) {
    return LoadUserDTO(
      id: int.parse(json['id'] as String),
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  LoadUserDTO.toEntity(User user)
    : super(id: user.id, name: user.name, email: user.email);
}
