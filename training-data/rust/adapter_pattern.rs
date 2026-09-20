// Adapts a legacy Celsius-only sensor to the Fahrenheit-based trait
// newer client code expects, without modifying either side.
struct LegacyWeatherStation;

impl LegacyWeatherStation {
    fn temperature_celsius(&self) -> f64 {
        21.5
    }
}

trait FahrenheitSource {
    fn temperature_fahrenheit(&self) -> f64;
}

struct FahrenheitAdapter {
    station: LegacyWeatherStation,
}

impl FahrenheitSource for FahrenheitAdapter {
    fn temperature_fahrenheit(&self) -> f64 {
        self.station.temperature_celsius() * 9.0 / 5.0 + 32.0
    }
}

fn report_temperature(source: &dyn FahrenheitSource) {
    println!("Current temperature: {:.1}F", source.temperature_fahrenheit());
}

fn main() {
    let adapter = FahrenheitAdapter {
        station: LegacyWeatherStation,
    };
    report_temperature(&adapter);
}
