fn encode(text: &str, rails: usize) -> String {
    let mut rows: Vec<String> = vec![String::new(); rails];
    let (mut r, mut down) = (0usize, true);
    for ch in text.chars() {
        rows[r].push(ch);
        if r == 0 {
            down = true;
        } else if r == rails - 1 {
            down = false;
        }
        r = if down { r + 1 } else { r - 1 };
    }
    rows.concat()
}

fn main() {
    println!("{}", encode("WEAREDISCOVERED", 3));
}
