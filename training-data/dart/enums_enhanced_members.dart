enum Planet {
  mercury(3.303e+23, 2.4397e6),
  earth(5.976e+24, 6.37814e6);

  final double mass, radius;
  const Planet(this.mass, this.radius);
  double get gravity => 6.67300E-11 * mass / (radius * radius);
}

enum Status {
  active('A'),
  inactive('I');

  final String code;
  const Status(this.code);
  static Status fromCode(String c) => values.firstWhere((s) => s.code == c);
}

void main() {
  for (var p in Planet.values) { print('${p.name} ${p.gravity.toStringAsFixed(2)}'); }
  print(Status.fromCode('I'));
  print(Status.active.index);
  print(Planet.values.map((p) => p.name).toList());
  print(Status.values.byName('active'));
  var s = Status.active;
  switch (s) {
    case Status.active: print('on');
    case Status.inactive: print('off');
  }
}
