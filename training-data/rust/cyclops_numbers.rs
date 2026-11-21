// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
fn is_cyclops(n: u32) -> bool {
    let s = n.to_string();
    s.len() % 2 == 1 && s.as_bytes()[s.len() / 2] == b'0' && s.matches('0').count() == 1
}

fn main() {
    println!("{}", (1..100000).filter(|&n| is_cyclops(n)).count());
}
