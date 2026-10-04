use std::str::FromStr;

#[derive(Debug, PartialEq)]
struct Rgb(u8, u8, u8);

#[derive(Debug, PartialEq)]
enum ParseRgbError {
    BadLength,
    BadHex,
}

impl FromStr for Rgb {
    type Err = ParseRgbError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let s = s.trim_start_matches('#');
        if s.len() != 6 {
            return Err(ParseRgbError::BadLength);
        }
        let p = |i: usize| u8::from_str_radix(&s[i..i + 2], 16).map_err(|_| ParseRgbError::BadHex);
        Ok(Rgb(p(0)?, p(2)?, p(4)?))
    }
}

fn main() {
    println!("{:?}", "#ff8000".parse::<Rgb>());
    println!("{:?}", "12".parse::<Rgb>());
    println!("{:?}", "zzzzzz".parse::<Rgb>());
    let c: Rgb = "0a0b0c".parse().unwrap();
    println!("{:?}", c);
}
