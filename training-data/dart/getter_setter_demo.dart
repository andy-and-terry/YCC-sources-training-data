class Temperature {
  double _celsius = 0;

  double get celsius => _celsius;
  set celsius(double v) {
    if (v < -273.15) throw ArgumentError('below absolute zero');
    _celsius = v;
  }

  double get fahrenheit => _celsius * 9 / 5 + 32;
  set fahrenheit(double f) => celsius = (f - 32) * 5 / 9;
}

void main() {
  final t = Temperature();
  t.celsius = 100;
  print(t.fahrenheit);
  t.fahrenheit = 32;
  print(t.celsius);
  try {
    t.celsius = -500;
  } on ArgumentError catch (e) {
    print('error: ${e.message}');
  }
}
