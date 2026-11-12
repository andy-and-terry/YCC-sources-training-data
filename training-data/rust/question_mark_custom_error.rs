use std::fmt;
use std::num::ParseIntError;

#[derive(Debug)]
enum AppError { Parse(ParseIntError), Negative(i64) }

impl From<ParseIntError> for AppError {
    fn from(e: ParseIntError) -> Self { AppError::Parse(e) }
}
impl fmt::Display for AppError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self { AppError::Parse(e) => write!(f, "parse: {}", e), AppError::Negative(n) => write!(f, "negative: {}", n) }
    }
}

fn parse_pos(s: &str) -> Result<i64, AppError> {
    let n: i64 = s.trim().parse()?;
    if n < 0 { return Err(AppError::Negative(n)); }
    Ok(n)
}

fn main() {
    for s in ["12", "-3", "x"] {
        match parse_pos(s) { Ok(n) => println!("{}", n), Err(e) => println!("{}", e) }
    }
}
