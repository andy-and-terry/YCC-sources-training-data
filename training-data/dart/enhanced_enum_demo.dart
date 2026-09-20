enum Planet {
  mercury(3.303e+23, 2.4397e6),
  venus(4.869e+24, 6.0518e6),
  earth(5.976e+24, 6.37814e6);

  final double mass;
  final double radius;

  const Planet(this.mass, this.radius);

  double get surfaceGravity => 6.67300e-11 * mass / (radius * radius);

  double surfaceWeight(double otherMass) => otherMass * surfaceGravity;
}

void main() {
  for (final planet in Planet.values) {
    final weight = planet.surfaceWeight(70);
    print('${planet.name}: gravity=${planet.surfaceGravity.toStringAsFixed(2)}, '
        'weight=${weight.toStringAsFixed(2)}');
  }
}
