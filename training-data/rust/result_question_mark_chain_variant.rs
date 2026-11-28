use std::num::ParseIntError;

fn sum_pair(a: &str, b: &str) -> Result<i32, ParseIntError> {
    Ok(a.parse::<i32>()? + b.parse::<i32>()?)
}

fn main() {
    println!("{:?}", sum_pair("2", "40"));
    println!("{:?}", sum_pair("2", "x").is_err());
}
