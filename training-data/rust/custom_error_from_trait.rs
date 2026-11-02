use std::fmt;
use std::num::ParseIntError;

#[derive(Debug)]
enum AppError { Parse(ParseIntError), Neg }

impl From<ParseIntError> for AppError {
    fn from(e: ParseIntError) -> Self { AppError::Parse(e) }
}
impl fmt::Display for AppError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self { AppError::Parse(e) => write!(f, "parse: {e}"), AppError::Neg => write!(f, "negative") }
    }
}

fn parse(s: &str) -> Result<i32, AppError> {
    let n: i32 = s.trim().parse()?;
    if n < 0 { Err(AppError::Neg) } else { Ok(n) }
}

fn main() {
    for s in ["5", "-1", "x"] {
        match parse(s) { Ok(n) => println!("{n}"), Err(e) => println!("{e}") }
    }
}
