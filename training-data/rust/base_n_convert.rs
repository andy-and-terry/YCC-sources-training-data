fn to_base(mut n: u64, base: u32) -> String {
    if n == 0 {
        return "0".into();
    }
    let mut out = Vec::new();
    while n > 0 {
        out.push(std::char::from_digit((n % base as u64) as u32, base).unwrap());
        n /= base as u64;
    }
    out.iter().rev().collect()
}

fn main() {
    println!("{} {} {}", to_base(255, 2), to_base(255, 16), to_base(1295, 36));
    println!("{:?}", u64::from_str_radix("zz", 36));
    println!("{:?}", u64::from_str_radix("9", 8).is_err());
}
