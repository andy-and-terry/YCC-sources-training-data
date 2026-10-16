struct Parser<'a> {
    src: &'a str,
    pos: usize,
}

impl<'a> Parser<'a> {
    fn new(src: &'a str) -> Self {
        Parser { src, pos: 0 }
    }

    fn next_word(&mut self) -> Option<&'a str> {
        let rest = &self.src[self.pos..];
        let rest_trim = rest.trim_start();
        if rest_trim.is_empty() {
            return None;
        }
        let start = self.pos + (rest.len() - rest_trim.len());
        let end = rest_trim.find(' ').map(|i| start + i).unwrap_or(self.src.len());
        self.pos = end;
        Some(&self.src[start..end])
    }
}

fn main() {
    let text = String::from("  borrow checker   rocks ");
    let mut p = Parser::new(&text);
    while let Some(w) = p.next_word() {
        println!("[{}]", w);
    }
}
