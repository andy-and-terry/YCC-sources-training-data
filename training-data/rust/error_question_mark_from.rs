use std::fmt;
use std::num::ParseIntError;

#[derive(Debug)]
enum AppError {
    Parse(ParseIntError),
    Negative(i64),
}

impl fmt::Display for AppError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            AppError::Parse(e) => write!(f, "parse error: {}", e),
            AppError::Negative(n) => write!(f, "negative value: {}", n),
        }
    }
}

impl From<ParseIntError> for AppError {
    fn from(e: ParseIntError) -> Self {
        AppError::Parse(e)
    }
}

fn parse_non_negative(s: &str) -> Result<i64, AppError> {
    let n: i64 = s.trim().parse()?;
    if n < 0 {
        return Err(AppError::Negative(n));
    }
    Ok(n)
}

fn main() {
    for s in ["42", "-7", "abc"] {
        match parse_non_negative(s) {
            Ok(n) => println!("ok {}", n),
            Err(e) => println!("{}", e),
        }
    }
}
