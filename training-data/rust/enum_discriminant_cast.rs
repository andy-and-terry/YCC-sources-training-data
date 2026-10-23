// Explicit discriminants allow `as` casts, and TryFrom handles the reverse.
use std::convert::{TryFrom, TryInto};

#[derive(Debug, Clone, Copy, PartialEq)]
#[repr(u8)]
enum Level {
    Low = 1,
    Medium = 5,
    High = 10,
}

impl TryFrom<u8> for Level {
    type Error = String;

    fn try_from(n: u8) -> Result<Self, Self::Error> {
        match n {
            1 => Ok(Level::Low),
            5 => Ok(Level::Medium),
            10 => Ok(Level::High),
            other => Err(format!("invalid level {}", other)),
        }
    }
}

fn main() {
    println!("{}", Level::Medium as u8);
    println!("{}", Level::High as i32 + 1);
    println!("{:?}", Level::try_from(5));
    println!("{:?}", Level::try_from(7));
    let parsed: Result<Level, _> = 10u8.try_into();
    println!("{:?}", parsed);
    println!("{}", (Level::Low as u8) < (Level::High as u8));
}
