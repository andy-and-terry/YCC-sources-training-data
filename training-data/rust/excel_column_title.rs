fn column_title(mut n: u32) -> String {
    let mut out = Vec::new();
    while n > 0 {
        n -= 1;
        out.push(b'A' + (n % 26) as u8);
        n /= 26;
    }
    out.reverse();
    String::from_utf8(out).unwrap()
}

fn main() {
    println!("{} {}", column_title(28), column_title(701)); // AB ZY
}
