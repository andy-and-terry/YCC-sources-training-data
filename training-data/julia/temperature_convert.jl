abstract type TempUnit end
struct Celsius <: TempUnit end
struct Fahrenheit <: TempUnit end
struct Kelvin <: TempUnit end

to_celsius(v, ::Celsius) = v
to_celsius(v, ::Fahrenheit) = (v - 32) * 5 / 9
to_celsius(v, ::Kelvin) = v - 273.15

from_celsius(v, ::Celsius) = v
from_celsius(v, ::Fahrenheit) = v * 9 / 5 + 32
from_celsius(v, ::Kelvin) = v + 273.15

convert_temp(v, from::TempUnit, to::TempUnit) = from_celsius(to_celsius(v, from), to)

println(round(convert_temp(100, Celsius(), Fahrenheit()), digits = 2))
println(round(convert_temp(212, Fahrenheit(), Kelvin()), digits = 2))
