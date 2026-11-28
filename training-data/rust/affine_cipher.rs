fn mod_inverse(a: i32, m: i32) -> i32 {
    (1..m).find(|x| a * x % m == 1).unwrap()
}

fn affine(text: &str, a: i32, b: i32, decrypt: bool) -> String {
    let inv = mod_inverse(a, 26);
    text.chars()
        .map(|ch| {
            if ch.is_ascii_uppercase() {
                let x = ch as i32 - 'A' as i32;
                let y = if decrypt { (inv * (x - b)).rem_euclid(26) } else { (a * x + b) % 26 };
                (y as u8 + b'A') as char
            } else {
                ch
            }
        })
        .collect()
}

fn main() {
    let c = affine("AFFINE", 5, 8, false);
    println!("{} {}", c, affine(&c, 5, 8, true));
}
