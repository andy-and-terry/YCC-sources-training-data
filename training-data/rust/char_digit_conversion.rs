// char <-> digit conversions with to_digit / from_digit and radix support.
fn parse_digits(s: &str) -> Option<Vec<u32>> {
    s.chars().map(|c| c.to_digit(10)).collect()
}

fn main() {
    println!("{:?}", '7'.to_digit(10));
    println!("{:?}", 'f'.to_digit(16));
    println!("{:?}", 'g'.to_digit(16));
    println!("{:?}", std::char::from_digit(11, 16));
    println!("{:?}", char::from_digit(11, 10));

    println!("{:?}", parse_digits("2024"));
    println!("{:?}", parse_digits("20x4"));

    let sum: u32 = "9875".chars().filter_map(|c| c.to_digit(10)).sum();
    println!("digit sum = {}", sum);

    // ASCII arithmetic alternative
    let c = 'c';
    println!("{}", (c as u8 - b'a') as usize);
    println!("{}", (b'a' + 3) as char);
    println!("{:?}", char::from_u32(0x41));
}
