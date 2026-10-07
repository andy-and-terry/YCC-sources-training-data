import 'dart:convert';

class User {
  final String name;
  final int age;
  User(this.name, this.age);

  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['name'] as String, json['age'] as int);

  Map<String, dynamic> toJson() => {'name': name, 'age': age};
}

void main() {
  const raw = '{"name":"Ann","age":30,"tags":["a","b"]}';
  final map = jsonDecode(raw) as Map<String, dynamic>;
  print(map['tags']);

  final user = User.fromJson(map);
  print(user.name);

  print(jsonEncode(user));
  print(jsonEncode([user, User('Bob', 25)]));
  print(const JsonEncoder.withIndent('  ').convert(user));
}
