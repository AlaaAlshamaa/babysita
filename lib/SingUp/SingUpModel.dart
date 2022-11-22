import 'dart:convert';

class SingUp_data {
  String name;
  String phone_number;
  String password;
  String password_confirmation;
  SingUp_data({
    required this.name,
    required this.phone_number,
    required this.password,
    required this.password_confirmation,
  });

  SingUp_data copyWith({
    String? name,
    String? phone_number,
    String? password,
    String? password_confirmation,
  }) {
    return SingUp_data(
      name: name ?? this.name,
      phone_number: phone_number ?? this.phone_number,
      password: password ?? this.password,
      password_confirmation:
          password_confirmation ?? this.password_confirmation,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'phone_number': phone_number});
    result.addAll({'password': password});
    result.addAll({'password_confirmation': password_confirmation});

    return result;
  }

  factory SingUp_data.fromMap(Map<String, dynamic> map) {
    return SingUp_data(
      name: map['name'] ?? '',
      phone_number: map['phone_number'] ?? '',
      password: map['password'] ?? '',
      password_confirmation: map['password_confirmation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SingUp_data.fromJson(String source) =>
      SingUp_data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SingUp_data(name: $name, phone_number: $phone_number, password: $password, password_confirmation: $password_confirmation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SingUp_data &&
        other.name == name &&
        other.phone_number == phone_number &&
        other.password == password &&
        other.password_confirmation == password_confirmation;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone_number.hashCode ^
        password.hashCode ^
        password_confirmation.hashCode;
  }
}
