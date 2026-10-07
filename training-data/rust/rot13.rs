use std::io::{self, BufRead, Write};

fn rot13(c: char) -> char {
    match c {
        'a'..='z' => ((c as u8 - b'a' + 13) % 26 + b'a') as char,
        'A'..='Z' => ((c as u8 - b'A' + 13) % 26 + b'A') as char,
        _ => c,
    }
}

fn main() {
    if std::env::args().nth(1).as_deref() == Some("-") {
        let stdout = io::stdout();
        let mut out = stdout.lock();
        for line in io::stdin().lock().lines() {
            writeln!(out, "{}", line.unwrap().chars().map(rot13).collect::<String>()).unwrap();
        }
        return;
    }
    let s: String = "Why did the chicken cross the road?".chars().map(rot13).collect();
    println!("{}", s);
    println!("{}", s.chars().map(rot13).collect::<String>());
}
