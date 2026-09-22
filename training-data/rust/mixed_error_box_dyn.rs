use std::error::Error;
use std::fmt;

#[derive(Debug)]
struct RangeError(i64);

impl fmt::Display for RangeError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "value {} is out of the allowed range", self.0)
    }
}

impl Error for RangeError {}

fn parse_percentage(input: &str) -> Result<i64, Box<dyn Error>> {
    let value: i64 = input.trim().parse()?;
    if !(0..=100).contains(&value) {
        return Err(Box::new(RangeError(value)));
    }
    Ok(value)
}

fn average_percentages(inputs: &[&str]) -> Result<f64, Box<dyn Error>> {
    let mut total = 0;
    for input in inputs {
        total += parse_percentage(input)?;
    }
    Ok(total as f64 / inputs.len() as f64)
}

fn main() {
    match average_percentages(&["10", "50", "90"]) {
        Ok(avg) => println!("average: {}", avg),
        Err(e) => println!("error: {}", e),
    }

    match average_percentages(&["10", "abc", "90"]) {
        Ok(avg) => println!("average: {}", avg),
        Err(e) => println!("error: {}", e),
    }

    match average_percentages(&["10", "150", "90"]) {
        Ok(avg) => println!("average: {}", avg),
        Err(e) => println!("error: {}", e),
    }
}
