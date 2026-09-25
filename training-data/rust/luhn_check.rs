fn luhn_valid(s: &str) -> bool {
    let digits: Option<Vec<u32>> = s.chars().filter(|c| !c.is_whitespace()).map(|c| c.to_digit(10)).collect();
    match digits {
        Some(d) if d.len() > 1 => {
            let sum: u32 = d
                .iter()
                .rev()
                .enumerate()
                .map(|(i, &x)| if i % 2 == 1 { let y = x * 2; if y > 9 { y - 9 } else { y } } else { x })
                .sum();
            sum % 10 == 0
        }
        _ => false,
    }
}

fn main() {
    println!("{} {}", luhn_valid("4539 3195 0343 6467"), luhn_valid("8273 1232 7352 0569"));
}
