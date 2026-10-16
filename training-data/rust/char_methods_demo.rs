fn main() {
    let s = "Hi, Rust 2024!";
    let letters = s.chars().filter(|c| c.is_alphabetic()).count();
    let digits: Vec<u32> = s.chars().filter_map(|c| c.to_digit(10)).collect();
    let upper = s.chars().filter(|c| c.is_uppercase()).count();
    println!("letters={} digits={:?} upper={}", letters, digits, upper);

    let c = 'g';
    println!("{} {} {}", c.to_ascii_uppercase(), c as u32, (c as u8 + 1) as char);
    println!("{:?}", char::from_digit(7, 10));
    println!("{:?}", std::char::from_u32(0x41));
    println!("alnum? {} whitespace? {}", '_'.is_alphanumeric(), '\t'.is_whitespace());
    println!("len_utf8 of 'é' = {}", 'é'.len_utf8());
}
