enum Planet {
  mercury(3.303e+23, 2.4397e6),
  earth(5.976e+24, 6.37814e6),
  mars(6.421e+23, 3.3972e6);

  const Planet(this.mass, this.radius);

  final double mass;
  final double radius;

  static const double _g = 6.67300E-11;

  double get surfaceGravity => _g * mass / (radius * radius);

  String get label => name[0].toUpperCase() + name.substring(1);
}

enum Status {
  active('A'),
  suspended('S');

  const Status(this.code);
  final String code;

  static Status fromCode(String c) => values.firstWhere((s) => s.code == c);
}

void main() {
  for (final p in Planet.values) {
    print('${p.label}: ${p.surfaceGravity.toStringAsFixed(2)} m/s^2');
  }
  print(Status.fromCode('S'));
  print(Status.active.index);
  print(Planet.values.byName('mars').radius);
}
