use std::fmt;
use std::str::FromStr;

#[derive(Debug, PartialEq)]
struct Rgb(u8, u8, u8);

#[derive(Debug, PartialEq)]
enum ParseColorError {
    BadLength(usize),
    BadHex(String),
}

impl fmt::Display for ParseColorError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            ParseColorError::BadLength(n) => write!(f, "expected 7 chars, got {n}"),
            ParseColorError::BadHex(s) => write!(f, "invalid hex component '{s}'"),
        }
    }
}

impl FromStr for Rgb {
    type Err = ParseColorError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        if s.len() != 7 || !s.starts_with('#') {
            return Err(ParseColorError::BadLength(s.len()));
        }
        let part = |i: usize| {
            u8::from_str_radix(&s[i..i + 2], 16)
                .map_err(|_| ParseColorError::BadHex(s[i..i + 2].to_string()))
        };
        Ok(Rgb(part(1)?, part(3)?, part(5)?))
    }
}

fn main() {
    println!("{:?}", "#ff8000".parse::<Rgb>());
    println!("{:?}", Rgb::from_str("#12"));
    match "#00zz00".parse::<Rgb>() {
        Ok(c) => println!("{:?}", c),
        Err(e) => println!("error: {e}"),
    }
    let nums: Result<Vec<i32>, _> = "1,2,x".split(',').map(str::parse::<i32>).collect();
    println!("{:?}", nums.is_err());
}
