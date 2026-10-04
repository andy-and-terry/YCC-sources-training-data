use std::fmt;
use std::num::ParseIntError;
use std::str::FromStr;

#[derive(Debug, PartialEq)]
struct Rgb(u8, u8, u8);

#[derive(Debug, PartialEq)]
enum ParseColorError {
    BadLength(usize),
    MissingHash,
    BadHex(ParseIntError),
}

impl fmt::Display for ParseColorError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            ParseColorError::BadLength(n) => write!(f, "expected 7 chars, got {}", n),
            ParseColorError::MissingHash => write!(f, "missing leading #"),
            ParseColorError::BadHex(e) => write!(f, "bad hex digit: {}", e),
        }
    }
}

impl From<ParseIntError> for ParseColorError {
    fn from(e: ParseIntError) -> Self {
        ParseColorError::BadHex(e)
    }
}

impl FromStr for Rgb {
    type Err = ParseColorError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        if s.len() != 7 {
            return Err(ParseColorError::BadLength(s.len()));
        }
        let hex = s.strip_prefix('#').ok_or(ParseColorError::MissingHash)?;
        let r = u8::from_str_radix(&hex[0..2], 16)?;
        let g = u8::from_str_radix(&hex[2..4], 16)?;
        let b = u8::from_str_radix(&hex[4..6], 16)?;
        Ok(Rgb(r, g, b))
    }
}

fn main() {
    for input in ["#ff8000", "ff8000", "#ff80", "#gg0000"] {
        match input.parse::<Rgb>() {
            Ok(c) => println!("{} -> {:?}", input, c),
            Err(e) => println!("{} -> error: {}", input, e),
        }
    }
    let c: Rgb = "#010203".parse().unwrap();
    assert_eq!(c, Rgb(1, 2, 3));
}
