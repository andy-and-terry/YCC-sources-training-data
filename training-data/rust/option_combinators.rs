fn parse_even(s: &str) -> Option<i32> {
    s.trim()
        .parse::<i32>()
        .ok()
        .filter(|n| n % 2 == 0)
}

fn first_char_upper(s: &str) -> Option<char> {
    s.chars().next().map(|c| c.to_ascii_uppercase())
}

fn main() {
    println!("{:?} {:?} {:?}", parse_even("42"), parse_even("7"), parse_even("x"));
    println!("{:?}", first_char_upper("rust"));
    let name: Option<&str> = None;
    println!("{}", name.unwrap_or("anonymous"));
    println!("{}", name.map_or(0, |n| n.len()));
    println!("{:?}", Some(3).and_then(|x| if x > 2 { Some(x * 2) } else { None }));
    println!("{:?}", None.or(Some(1)).xor(None::<i32>));
    println!("{:?}", Some(1).zip(Some("a")));
    let v: Option<Vec<i32>> = ["1", "2", "3"].iter().map(|s| s.parse().ok()).collect();
    println!("{:?}", v);
    let mut slot = Some(5);
    println!("{:?} {:?}", slot.take(), slot);
}
