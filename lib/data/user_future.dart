// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserFuture {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  UserFuture({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  UserFuture copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
  }) {
    return UserFuture(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
    };
  }

  factory UserFuture.fromMap(Map<String, dynamic> map) {
    return UserFuture(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFuture.fromJson(String source) =>
      UserFuture.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserFuture(id: $id, name: $name, username: $username, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(covariant UserFuture other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.username == username &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        phone.hashCode;
  }
}
