enum TempUnit {
    case celsius, fahrenheit, kelvin

    func toCelsius(_ v: Double) -> Double {
        switch self {
        case .celsius: return v
        case .fahrenheit: return (v - 32) * 5 / 9
        case .kelvin: return v - 273.15
        }
    }

    func fromCelsius(_ v: Double) -> Double {
        switch self {
        case .celsius: return v
        case .fahrenheit: return v * 9 / 5 + 32
        case .kelvin: return v + 273.15
        }
    }
}

func convert(_ v: Double, from: TempUnit, to: TempUnit) -> Double { to.fromCelsius(from.toCelsius(v)) }

print(convert(100, from: .celsius, to: .fahrenheit))
print(convert(212, from: .fahrenheit, to: .kelvin))
