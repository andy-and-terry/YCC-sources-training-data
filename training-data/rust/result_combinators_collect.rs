fn parse(s: &str) -> Result<i32, std::num::ParseIntError> {
    s.trim().parse()
}

fn main() {
    let good: Result<Vec<i32>, _> = "1 2 3".split(' ').map(parse).collect();
    let bad: Result<Vec<i32>, _> = "1 x 3".split(' ').map(parse).collect();
    println!("{:?}", good);
    println!("{}", bad.is_err());
    let (oks, errs): (Vec<_>, Vec<_>) = ["4", "z", "5"].iter().map(|s| parse(s)).partition(|r| r.is_ok());
    println!("{} {}", oks.len(), errs.len());
    println!("{:?}", parse("7").map(|n| n + 1).map_err(|e| e.to_string()));
    println!("{:?}", parse("q").map_err(|e| e.to_string()));
    println!("{}", parse("q").unwrap_or_default());
    println!("{:?}", parse("8").and_then(|n| if n > 5 { Ok(n) } else { "0".parse() }));
    println!("{:?}", parse("9").ok());
    let total: i32 = ["1", "2"].iter().filter_map(|s| s.parse::<i32>().ok()).sum();
    println!("{total}");
}
