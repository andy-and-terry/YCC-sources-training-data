use std::num::ParseIntError;
use std::str::FromStr;

#[derive(Debug, PartialEq)]
struct Rgb(u8, u8, u8);

impl FromStr for Rgb {
    type Err = ParseIntError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let s = s.trim_start_matches('#');
        let r = u8::from_str_radix(&s[0..2], 16)?;
        let g = u8::from_str_radix(&s[2..4], 16)?;
        let b = u8::from_str_radix(&s[4..6], 16)?;
        Ok(Rgb(r, g, b))
    }
}

fn main() {
    println!("{:?}", "#ff8000".parse::<Rgb>());
    println!("{:?}", "zz0000".parse::<Rgb>().is_err());
    println!("{:?}", "42".parse::<i32>());
    println!("{:?}", "4x".parse::<i32>().is_err());
    println!("{:?}", "3.5".parse::<f64>());
}
