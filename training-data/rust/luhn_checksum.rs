fn luhn_sum<I: DoubleEndedIterator<Item = u32>>(digits: I) -> u32 {
    digits
        .rev()
        .enumerate()
        .map(|(i, d)| if i % 2 == 1 { let x = d * 2; if x > 9 { x - 9 } else { x } } else { d })
        .sum()
}

fn luhn_valid(s: &str) -> bool {
    let cleaned: String = s.chars().filter(|c| !c.is_whitespace()).collect();
    if cleaned.len() < 2 || !cleaned.chars().all(|c| c.is_ascii_digit()) {
        return false;
    }
    luhn_sum(cleaned.chars().map(|c| c.to_digit(10).unwrap())) % 10 == 0
}

fn check_digit(partial: &str) -> u32 {
    let digits = partial.chars().map(|c| c.to_digit(10).unwrap()).chain(std::iter::once(0));
    let digits: Vec<u32> = digits.collect();
    (10 - luhn_sum(digits.into_iter()) % 10) % 10
}

fn main() {
    println!("{} {} {}", luhn_valid("4539 3195 0343 6467"), luhn_valid("8273 1232 7352 0569"), luhn_valid("12a4"));
    println!("check digit for 7992739871: {}", check_digit("7992739871"));
}
