# Implicit conversions with the converter keyword
type
  Celsius = distinct float
  Fahrenheit = distinct float

converter toFahrenheit(c: Celsius): Fahrenheit =
  Fahrenheit(float(c) * 9.0 / 5.0 + 32.0)

proc describe(f: Fahrenheit): string =
  $float(f) & " F"

converter intToFloat(i: int): float = float(i)

proc half(x: float): float = x / 2.0

let boiling = Celsius(100.0)
echo describe(boiling)
echo half(7)
