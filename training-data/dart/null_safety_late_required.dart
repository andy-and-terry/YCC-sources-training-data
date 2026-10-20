class User {
  final String name;
  final String? email;
  late final int score;
  User({required this.name, this.email});
}

String describe(String? s) => s?.toUpperCase() ?? 'none';

void main() {
  var u = User(name: 'Ada');
  u.score = 10;
  print('${u.name} ${u.email ?? "no email"} ${u.score}');
  print(describe(null) + describe('x'));
  String? maybe;
  maybe ??= 'default';
  print(maybe);
  int? n = int.tryParse('42');
  print(n! + 1);
  List<int?> xs = [1, null, 3];
  print(xs.whereType<int>().fold(0, (a, b) => a + b));
  print(xs.map((e) => e ?? 0).toList());
  dynamic d = 'text';
  if (d is String) print(d.length);
}
