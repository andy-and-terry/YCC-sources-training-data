enum Planet {
  mercury(3.303e+23, 2.4397e6),
  earth(5.976e+24, 6.37814e6);

  const Planet(this.mass, this.radius);
  final double mass;
  final double radius;

  double get surfaceGravity => 6.67300E-11 * mass / (radius * radius);
  String get label => name[0].toUpperCase() + name.substring(1);
}

void main() {
  for (final p in Planet.values) {
    print('${p.label}: ${p.surfaceGravity.toStringAsFixed(2)} m/s^2');
  }
  print(Planet.values.byName('earth').index);
  print(Planet.earth.compareTo(Planet.mercury));
}
