use std::fmt;

#[derive(Debug)]
enum ParseError {
    Empty,
    NotANumber(String),
    Negative(i64),
}

impl fmt::Display for ParseError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            ParseError::Empty => write!(f, "input was empty"),
            ParseError::NotANumber(s) => write!(f, "not a number: {}", s),
            ParseError::Negative(n) => write!(f, "number must be non-negative, got {}", n),
        }
    }
}

fn parse_positive(input: &str) -> Result<i64, ParseError> {
    if input.is_empty() {
        return Err(ParseError::Empty);
    }
    let n: i64 = input.parse().map_err(|_| ParseError::NotANumber(input.to_string()))?;
    if n < 0 {
        return Err(ParseError::Negative(n));
    }
    Ok(n)
}

fn sum_inputs(inputs: &[&str]) -> Result<i64, ParseError> {
    let mut total = 0;
    for input in inputs {
        total += parse_positive(input)?;
    }
    Ok(total)
}

fn main() {
    match sum_inputs(&["1", "2", "3"]) {
        Ok(total) => println!("sum: {}", total),
        Err(e) => println!("error: {}", e),
    }

    match sum_inputs(&["1", "-2", "3"]) {
        Ok(total) => println!("sum: {}", total),
        Err(e) => println!("error: {}", e),
    }
}
