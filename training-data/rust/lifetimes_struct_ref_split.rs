struct Parser<'a> { rest: &'a str }

impl<'a> Parser<'a> {
    fn next_word(&mut self) -> Option<&'a str> {
        let s = self.rest.trim_start();
        if s.is_empty() { return None; }
        let end = s.find(char::is_whitespace).unwrap_or(s.len());
        let (w, r) = s.split_at(end);
        self.rest = r;
        Some(w)
    }
}

fn longest<'a>(a: &'a str, b: &'a str) -> &'a str { if a.len() >= b.len() { a } else { b } }

fn main() {
    let mut p = Parser { rest: "  alpha beta  gamma" };
    while let Some(w) = p.next_word() { print!("[{}]", w); }
    println!(" {}", longest("hi", "there"));
}
