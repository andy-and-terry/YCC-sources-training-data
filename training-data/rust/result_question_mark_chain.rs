use std::num::ParseIntError;

fn parse_sum(a: &str, b: &str) -> Result<i32, ParseIntError> {
    Ok(a.trim().parse::<i32>()? + b.trim().parse::<i32>()?)
}

fn main() {
    println!("{:?}", parse_sum("1", " 2 "));
    println!("{:?}", parse_sum("1", "x").is_err());
}
