enum Planet {
  mercury(3.303e+23, 2.4397e6),
  earth(5.976e+24, 6.37814e6),
  mars(6.421e+23, 3.3972e6);

  const Planet(this.mass, this.radius);

  final double mass;
  final double radius;

  static const double _g = 6.67300E-11;

  double get surfaceGravity => _g * mass / (radius * radius);

  double weightOn(double otherMass) => otherMass * surfaceGravity;
}

void main() {
  for (final p in Planet.values) {
    print('${p.name}: ${p.surfaceGravity.toStringAsFixed(2)} m/s^2');
  }
  print(Planet.mars.weightOn(70).toStringAsFixed(1));
  print(Planet.values.byName("earth"));
}

