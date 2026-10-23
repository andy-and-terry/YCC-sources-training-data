import Foundation

// Measurement carries a unit, so conversions are type-checked.
let marathon = Measurement(value: 42.195, unit: UnitLength.kilometers)
print(marathon.converted(to: .miles).value.rounded(toPlaces: 2))
print(marathon.converted(to: .meters).value)

let boiling = Measurement(value: 100, unit: UnitTemperature.celsius)
print(boiling.converted(to: .fahrenheit).value)
print(boiling.converted(to: .kelvin).value)

// Arithmetic converts to a common unit automatically.
let a = Measurement(value: 1, unit: UnitLength.kilometers)
let b = Measurement(value: 500, unit: UnitLength.meters)
let sum = a + b
print(sum.value, sum.unit.symbol)
print(a > b)

let mass = Measurement(value: 2.5, unit: UnitMass.kilograms)
print(mass.converted(to: .grams).value)

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let p = pow(10.0, Double(places))
        return (self * p).rounded() / p
    }
}
