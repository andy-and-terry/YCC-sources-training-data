struct Vigenere {
    shifts: Vec<u8>,
}

impl Vigenere {
    fn new(key: &str) -> Option<Self> {
        let shifts: Vec<u8> = key.bytes().filter(u8::is_ascii_alphabetic).map(|b| b.to_ascii_lowercase() - b'a').collect();
        (!shifts.is_empty()).then_some(Vigenere { shifts })
    }

    fn apply(&self, text: &str, encrypt: bool) -> String {
        let mut k = 0;
        text.chars()
            .map(|c| {
                if !c.is_ascii_alphabetic() {
                    return c;
                }
                let base = if c.is_ascii_uppercase() { b'A' } else { b'a' };
                let s = self.shifts[k % self.shifts.len()];
                k += 1;
                let shift = if encrypt { s } else { 26 - s };
                (base + (c as u8 - base + shift) % 26) as char
            })
            .collect()
    }
}

fn main() {
    let v = Vigenere::new("LEMON").expect("key has letters");
    let c = v.apply("Attack at dawn!", true);
    println!("{} -> {}", c, v.apply(&c, false));
    println!("{}", Vigenere::new("123").is_none());
}
