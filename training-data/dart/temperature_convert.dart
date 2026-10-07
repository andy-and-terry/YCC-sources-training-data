enum TempUnit {
  celsius,
  fahrenheit,
  kelvin;

  double toCelsius(double v) => switch (this) {
        TempUnit.celsius => v,
        TempUnit.fahrenheit => (v - 32) * 5 / 9,
        TempUnit.kelvin => v - 273.15,
      };

  double fromCelsius(double v) => switch (this) {
        TempUnit.celsius => v,
        TempUnit.fahrenheit => v * 9 / 5 + 32,
        TempUnit.kelvin => v + 273.15,
      };
}

double convert(double v, TempUnit from, TempUnit to) => to.fromCelsius(from.toCelsius(v));

void main() {
  print(convert(100, TempUnit.celsius, TempUnit.fahrenheit).toStringAsFixed(2));
  print(convert(212, TempUnit.fahrenheit, TempUnit.kelvin).toStringAsFixed(2));
}
