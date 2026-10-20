use std::str::FromStr;

#[derive(Debug, PartialEq)]
struct Rgb(u8, u8, u8);

#[derive(Debug, PartialEq)]
enum ColorError {
    BadLength,
    BadHex,
}

impl FromStr for Rgb {
    type Err = ColorError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let s = s.strip_prefix('#').unwrap_or(s);
        if s.len() != 6 {
            return Err(ColorError::BadLength);
        }
        let ch = |i: usize| u8::from_str_radix(&s[i..i + 2], 16).map_err(|_| ColorError::BadHex);
        Ok(Rgb(ch(0)?, ch(2)?, ch(4)?))
    }
}

fn main() {
    println!("{:?}", "#ff8000".parse::<Rgb>());
    println!("{:?}", "ff80".parse::<Rgb>());
    println!("{:?}", "#gg0000".parse::<Rgb>());
    println!("{:?}", Rgb::from_str("00ff00"));
}
