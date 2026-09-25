fn is_valid_isbn10(isbn: &str) -> bool {
    let chars: Vec<char> = isbn.chars().filter(|&c| c != '-').collect();
    if chars.len() != 10 {
        return false;
    }
    let mut total = 0;
    for (i, &c) in chars.iter().enumerate() {
        let v = match c {
            'X' if i == 9 => 10,
            d if d.is_ascii_digit() => d.to_digit(10).unwrap(),
            _ => return false,
        };
        total += v * (10 - i as u32);
    }
    total % 11 == 0
}

fn main() {
    for s in ["3-598-21508-8", "3-598-21507-X", "3-598-21508-9"] {
        println!("{s} {}", is_valid_isbn10(s));
    }
}
