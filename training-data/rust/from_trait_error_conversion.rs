use std::fmt;
use std::num::ParseIntError;

#[derive(Debug)]
enum AppError {
    Parse(ParseIntError),
    Negative(i64),
}

impl From<ParseIntError> for AppError {
    fn from(e: ParseIntError) -> Self {
        AppError::Parse(e)
    }
}

impl fmt::Display for AppError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            AppError::Parse(e) => write!(f, "parse: {e}"),
            AppError::Negative(n) => write!(f, "negative: {n}"),
        }
    }
}

fn read(s: &str) -> Result<i64, AppError> {
    let n: i64 = s.parse()?;
    if n < 0 { Err(AppError::Negative(n)) } else { Ok(n) }
}

fn main() {
    for s in ["5", "-2", "z"] {
        match read(s) { Ok(n) => println!("ok {n}"), Err(e) => println!("{e}") }
    }
}
