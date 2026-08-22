fn encrypt(text: &str, shift: i32) -> String {
    text.chars()
        .map(|ch| {
            if ch.is_ascii_alphabetic() {
                let base = if ch.is_ascii_uppercase() { b'A' } else { b'a' };
                let shifted = (((ch as u8 - base) as i32 + shift).rem_euclid(26)) as u8 + base;
                shifted as char
            } else {
                ch
            }
        })
        .collect()
}

fn decrypt(text: &str, shift: i32) -> String {
    encrypt(text, -shift)
}

fn main() {
    let cipher = encrypt("Hello, World!", 3);
    println!("{}", cipher);
    println!("{}", decrypt(&cipher, 3));
}
