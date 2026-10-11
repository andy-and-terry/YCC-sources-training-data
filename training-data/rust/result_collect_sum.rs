fn parse_all(items: &[&str]) -> Result<Vec<i32>, std::num::ParseIntError> {
    items.iter().map(|s| s.parse::<i32>()).collect()
}

fn main() {
    println!("{:?}", parse_all(&["1", "2", "3"]));
    println!("{:?}", parse_all(&["1", "x", "3"]));

    let opts: Option<Vec<u32>> = ["4", "5"].iter().map(|s| s.parse().ok()).collect();
    println!("{:?}", opts);

    let total: Result<i32, String> = [1, 2, 3]
        .iter()
        .map(|&x| if x > 0 { Ok(x) } else { Err(format!("bad {}", x)) })
        .sum();
    println!("{:?}", total);

    let (ok, bad): (Vec<_>, Vec<_>) = ["7", "a", "9"].iter().map(|s| s.parse::<i32>()).partition(|r| r.is_ok());
    println!("ok={} bad={}", ok.len(), bad.len());
}
