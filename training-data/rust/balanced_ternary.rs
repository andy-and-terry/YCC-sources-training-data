fn to_bt(mut n: i64) -> String {
    if n == 0 {
        return "0".to_string();
    }
    let mut out = Vec::new();
    while n != 0 {
        match n.rem_euclid(3) {
            0 => out.push('0'),
            1 => { out.push('+'); n -= 1; }
            _ => { out.push('-'); n += 1; }
        }
        n /= 3;
    }
    out.iter().rev().collect()
}

fn from_bt(s: &str) -> i64 {
    s.chars().fold(0, |acc, c| {
        acc * 3 + match c { '+' => 1, '-' => -1, _ => 0 }
    })
}

fn main() {
    for k in [-14, -1, 0, 5, 42] {
        let s = to_bt(k);
        assert_eq!(from_bt(&s), k);
        println!("{} {}", k, s);
    }
}
