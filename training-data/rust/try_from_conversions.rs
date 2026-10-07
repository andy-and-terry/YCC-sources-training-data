use std::convert::TryFrom;

// TryFrom models a conversion that can fail, unlike From. The
// blanket TryInto impl comes for free once TryFrom is implemented.
#[derive(Debug)]
struct Percentage(u8);

#[derive(Debug)]
struct OutOfRange(i64);

impl TryFrom<i64> for Percentage {
    type Error = OutOfRange;

    fn try_from(value: i64) -> Result<Self, Self::Error> {
        if (0..=100).contains(&value) {
            Ok(Percentage(value as u8))
        } else {
            Err(OutOfRange(value))
        }
    }
}

#[derive(Debug)]
enum TrafficLight {
    Red,
    Yellow,
    Green,
}

impl TryFrom<u8> for TrafficLight {
    type Error = String;

    fn try_from(code: u8) -> Result<Self, Self::Error> {
        match code {
            0 => Ok(TrafficLight::Red),
            1 => Ok(TrafficLight::Yellow),
            2 => Ok(TrafficLight::Green),
            other => Err(format!("no traffic light for code {}", other)),
        }
    }
}

fn main() {
    match Percentage::try_from(85) {
        Ok(p) => println!("valid: {:?}", p),
        Err(e) => println!("invalid: {:?}", e),
    }

    match Percentage::try_from(150) {
        Ok(p) => println!("valid: {:?}", p),
        Err(e) => println!("invalid: {:?}", e),
    }

    // TryInto is the mirror trait, usable via .try_into().
    let light: Result<TrafficLight, String> = 1u8.try_into();
    println!("{:?}", light);

    let bad_light: Result<TrafficLight, String> = 9u8.try_into();
    println!("{:?}", bad_light);

    // Standard-library numeric conversions also use TryFrom.
    let big: i64 = 4_000_000_000;
    let as_i32 = i32::try_from(big);
    println!("{:?}", as_i32);
}
