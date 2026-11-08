fn rot47(s: &str) -> String {
    s.chars()
        .map(|c| match c as u32 {
            n @ 33..=126 => char::from_u32(33 + (n - 33 + 47) % 94).unwrap(),
            _ => c,
        })
        .collect()
}

fn main() {
    let e = rot47("Hello, World!");
    println!("{} {}", e, rot47(&e));
}
