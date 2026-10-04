fn parse_even(s: &str) -> Option<i32> {
    s.parse::<i32>().ok().filter(|n| n % 2 == 0)
}

fn main() {
    println!("{:?}", parse_even("42"));
    println!("{:?}", parse_even("7"));
    println!("{:?}", parse_even("x"));

    let name: Option<&str> = Some("ada");
    println!("{:?}", name.map(|n| n.to_uppercase()));
    println!("{}", name.map_or(0, |n| n.len()));
    println!("{:?}", name.and_then(|n| n.chars().next()));
    println!("{}", None.unwrap_or("default"));
    println!("{:?}", Some(1).or(Some(2)));
    println!("{:?}", Some(3).xor(None::<i32>));
    println!("{:?}", Some(1).zip(Some("a")));
    println!("{:?}", Some(5).ok_or("missing"));

    let mut slot = Some(10);
    if let Some(v) = slot.as_mut() {
        *v += 1;
    }
    println!("{:?} {:?}", slot.take(), slot);
    println!("{:?}", slot.get_or_insert(99));
}
