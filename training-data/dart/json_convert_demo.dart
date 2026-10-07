import 'dart:convert';

class User {
  final String name;
  final int age;
  final List<String> tags;

  User(this.name, this.age, this.tags);

  factory User.fromJson(Map<String, dynamic> json) => User(
        json['name'] as String,
        json['age'] as int,
        List<String>.from(json['tags'] as List),
      );

  Map<String, dynamic> toJson() => {'name': name, 'age': age, 'tags': tags};
}

void main() {
  const raw = '{"name": "Ada", "age": 36, "tags": ["math", "code"]}';
  final user = User.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  print('${user.name} (${user.age}) ${user.tags}');

  print(jsonEncode(user));
  print(const JsonEncoder.withIndent('  ').convert(user.toJson()));

  try {
    jsonDecode('{bad json}');
  } on FormatException catch (e) {
    print('invalid: ${e.message}');
  }
}
