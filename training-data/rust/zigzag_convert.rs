fn zigzag(s: &str, rows: usize) -> String {
    if rows == 1 || rows >= s.len() {
        return s.to_string();
    }
    let mut lines = vec![String::new(); rows];
    let (mut r, mut down) = (0usize, true);
    for ch in s.chars() {
        lines[r].push(ch);
        if r == 0 {
            down = true;
        } else if r == rows - 1 {
            down = false;
        }
        r = if down { r + 1 } else { r - 1 };
    }
    lines.concat()
}

fn main() {
    println!("{}", zigzag("PAYPALISHIRING", 3));
}
