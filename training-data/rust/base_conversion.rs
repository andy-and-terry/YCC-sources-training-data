const DIGITS: &[u8] = b"0123456789abcdefghijklmnopqrstuvwxyz";

fn to_base(n: i64, base: u32) -> String {
    assert!((2..=36).contains(&base));
    if n == 0 {
        return "0".into();
    }
    let mut v = n.unsigned_abs();
    let mut out = Vec::new();
    while v > 0 {
        out.push(DIGITS[(v % base as u64) as usize]);
        v /= base as u64;
    }
    if n < 0 {
        out.push(b'-');
    }
    out.reverse();
    String::from_utf8(out).unwrap()
}

fn main() {
    for (n, b) in [(255i64, 2u32), (255, 16), (-1295, 36), (0, 7), (i64::MIN, 36)] {
        let s = to_base(n, b);
        let back = i64::from_str_radix(&s, b);
        println!("{} base {} = {} (roundtrip {:?})", n, b, s, back.map(|x| x == n));
    }
    println!("{:b} {:o} {:x} {:X}", 2024, 2024, 2024, 2024);
}
