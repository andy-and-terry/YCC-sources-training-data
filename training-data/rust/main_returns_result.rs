use std::error::Error;
use std::fmt;

#[derive(Debug)]
struct ConfigError(String);

impl fmt::Display for ConfigError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "config error: {}", self.0)
    }
}

impl Error for ConfigError {}

fn read_port(s: &str) -> Result<u16, Box<dyn Error>> {
    let p: u16 = s.parse()?;
    if p < 1024 {
        return Err(Box::new(ConfigError(format!("port {} is privileged", p))));
    }
    Ok(p)
}

fn main() -> Result<(), Box<dyn Error>> {
    println!("port = {}", read_port("8080")?);
    match read_port("80") {
        Err(e) => println!("handled: {}", e),
        Ok(_) => unreachable!(),
    }
    let p = read_port("abc")?;
    println!("never printed {}", p);
    Ok(())
}
