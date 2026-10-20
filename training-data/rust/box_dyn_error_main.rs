use std::error::Error;

fn run() -> Result<(), Box<dyn Error>> {
    let n: u8 = "300".parse()?;
    println!("{}", n);
    Ok(())
}

fn main() {
    if let Err(e) = run() { println!("error: {}", e); }
}
