#[derive(Clone, Copy, Debug)]
enum Unit {
    Celsius,
    Fahrenheit,
    Kelvin,
}

impl Unit {
    fn to_celsius(self, v: f64) -> f64 {
        match self {
            Unit::Celsius => v,
            Unit::Fahrenheit => (v - 32.0) * 5.0 / 9.0,
            Unit::Kelvin => v - 273.15,
        }
    }
    fn from_celsius(self, c: f64) -> f64 {
        match self {
            Unit::Celsius => c,
            Unit::Fahrenheit => c * 9.0 / 5.0 + 32.0,
            Unit::Kelvin => c + 273.15,
        }
    }
}

fn convert(v: f64, from: Unit, to: Unit) -> f64 {
    to.from_celsius(from.to_celsius(v))
}

fn main() {
    println!("{:.2}", convert(100.0, Unit::Celsius, Unit::Fahrenheit));
    println!("{:.2}", convert(212.0, Unit::Fahrenheit, Unit::Kelvin));
}
