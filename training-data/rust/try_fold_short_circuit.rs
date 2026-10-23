fn checked_sum(values: &[u8]) -> Option<u8> {
    values.iter().try_fold(0u8, |acc, &v| acc.checked_add(v))
}

fn parse_and_sum(items: &[&str]) -> Result<i32, std::num::ParseIntError> {
    items.iter().try_fold(0i32, |acc, s| Ok(acc + s.parse::<i32>()?))
}

fn main() {
    println!("{:?}", checked_sum(&[10, 20, 30]));
    println!("{:?}", checked_sum(&[200, 50, 10]));

    println!("{:?}", parse_and_sum(&["1", "2", "3"]));
    println!("{:?}", parse_and_sum(&["1", "x", "3"]).is_err());

    let mut visited = 0;
    let found = (1..100).try_for_each(|n| {
        visited += 1;
        if n * n > 50 { Err(n) } else { Ok(()) }
    });
    println!("{:?} after {} steps", found, visited);
}
