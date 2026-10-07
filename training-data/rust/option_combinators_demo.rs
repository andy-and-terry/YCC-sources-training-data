fn find_user(id: u32) -> Option<&'static str> {
    match id {
        1 => Some("alice"),
        2 => Some("bob"),
        _ => None,
    }
}

fn main() {
    let name = find_user(1);
    println!("{:?}", name.map(|n| n.to_uppercase()));
    println!("{:?}", find_user(9).map(|n| n.len()));
    println!("{}", find_user(9).unwrap_or("nobody"));
    println!("{}", find_user(9).map_or(0, |n| n.len()));
    println!("{}", find_user(2).map_or_else(|| "none".to_string(), |n| format!("hi {}", n)));

    println!("{:?}", find_user(1).and_then(|n| n.chars().next()));
    println!("{:?}", find_user(1).filter(|n| n.len() > 10));
    println!("{:?}", find_user(9).or(find_user(2)));
    println!("{:?}", find_user(9).or_else(|| Some("fallback")));
    println!("{:?}", find_user(1).xor(find_user(2)));
    println!("{:?}", find_user(1).zip(find_user(2)));

    let r: Result<&str, String> = find_user(9).ok_or("not found".to_string());
    println!("{:?}", r);

    let mut slot = Some(3);
    let taken = slot.take();
    println!("{:?} {:?}", taken, slot);
    println!("{}", slot.get_or_insert(7));
    println!("{:?}", slot.replace(8));
    println!("{}", slot.is_some_and(|v| v > 5));

    let all: Option<Vec<u32>> = ["1", "2", "3"].iter().map(|s| s.parse().ok()).collect();
    println!("{:?}", all);
    let bad: Option<Vec<u32>> = ["1", "x"].iter().map(|s| s.parse().ok()).collect();
    println!("{:?}", bad);
}
