use std::num::ParseIntError;

fn parse_sum(a: &str, b: &str) -> Result<i32, ParseIntError> {
    let x: i32 = a.trim().parse()?;
    let y: i32 = b.trim().parse()?;
    Ok(x + y)
}

fn main() {
    println!("{:?}", parse_sum("4", " 5 "));
    match parse_sum("4", "x") {
        Ok(v) => println!("{}", v),
        Err(e) => println!("error: {}", e),
    }
    let all: Result<Vec<i32>, _> = ["1", "2", "3"].iter().map(|s| s.parse::<i32>()).collect();
    println!("{:?}", all);
}
