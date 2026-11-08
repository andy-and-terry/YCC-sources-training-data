use std::str::FromStr;

#[derive(Debug)]
struct Point {
    x: i32,
    y: i32,
}

impl FromStr for Point {
    type Err = String;
    fn from_str(s: &str) -> Result<Self, Self::Err> {
        let (a, b) = s.split_once(',').ok_or("missing comma")?;
        let x = a.trim().parse().map_err(|e| format!("x: {e}"))?;
        let y = b.trim().parse().map_err(|e| format!("y: {e}"))?;
        Ok(Point { x, y })
    }
}

fn main() {
    println!("{:?}", "3, 4".parse::<Point>());
    println!("{:?}", "3;4".parse::<Point>());
    println!("{:?}", "a,4".parse::<Point>());
}
