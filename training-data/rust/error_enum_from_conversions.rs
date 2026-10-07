use std::fmt;
use std::num::ParseIntError;

#[derive(Debug)]
enum ConfigError {
    Parse(ParseIntError),
    OutOfRange(i64),
}

impl fmt::Display for ConfigError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            ConfigError::Parse(e) => write!(f, "could not parse value: {}", e),
            ConfigError::OutOfRange(v) => write!(f, "value {} is out of range", v),
        }
    }
}

impl std::error::Error for ConfigError {}

// Implementing `From` lets the `?` operator convert a `ParseIntError` into
// a `ConfigError` automatically, with no `map_err` at the call site.
impl From<ParseIntError> for ConfigError {
    fn from(err: ParseIntError) -> Self {
        ConfigError::Parse(err)
    }
}

fn parse_port(input: &str) -> Result<u16, ConfigError> {
    let value: i64 = input.trim().parse()?;
    if !(1..=65535).contains(&value) {
        return Err(ConfigError::OutOfRange(value));
    }
    Ok(value as u16)
}

fn main() {
    for input in ["8080", "not-a-number", "70000"] {
        match parse_port(input) {
            Ok(port) => println!("port: {}", port),
            Err(e) => println!("error: {}", e),
        }
    }
}
