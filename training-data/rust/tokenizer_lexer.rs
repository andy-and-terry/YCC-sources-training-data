#[derive(Debug, PartialEq)]
enum Token<'a> {
    Number(f64),
    Ident(&'a str),
    Keyword(&'a str),
    Str(&'a str),
    Op(&'a str),
}

struct Lexer<'a> {
    src: &'a str,
    pos: usize,
    line: usize,
}

const KEYWORDS: &[&str] = &["let", "fn", "if", "else", "while", "return"];
const TWO_CHAR_OPS: &[&str] = &["==", "!=", "<=", ">=", "&&", "||", "->"];

impl<'a> Iterator for Lexer<'a> {
    type Item = Result<(usize, Token<'a>), String>;

    fn next(&mut self) -> Option<Self::Item> {
        let bytes = self.src.as_bytes();
        loop {
            match bytes.get(self.pos) {
                Some(b'\n') => {
                    self.line += 1;
                    self.pos += 1;
                }
                Some(b) if b.is_ascii_whitespace() => self.pos += 1,
                Some(b'/') if bytes.get(self.pos + 1) == Some(&b'/') => {
                    while self.pos < bytes.len() && bytes[self.pos] != b'\n' {
                        self.pos += 1;
                    }
                }
                _ => break,
            }
        }
        let start = self.pos;
        let c = *bytes.get(start)?;
        let take_while = |pos: &mut usize, f: &dyn Fn(u8) -> bool| {
            while *pos < bytes.len() && f(bytes[*pos]) {
                *pos += 1;
            }
        };
        let tok = if c.is_ascii_digit() {
            take_while(&mut self.pos, &|b| b.is_ascii_digit() || b == b'.');
            Token::Number(self.src[start..self.pos].parse().ok()?)
        } else if c.is_ascii_alphabetic() || c == b'_' {
            take_while(&mut self.pos, &|b| b.is_ascii_alphanumeric() || b == b'_');
            let word = &self.src[start..self.pos];
            if KEYWORDS.contains(&word) { Token::Keyword(word) } else { Token::Ident(word) }
        } else if c == b'"' {
            self.pos += 1;
            take_while(&mut self.pos, &|b| b != b'"');
            if self.pos >= bytes.len() {
                return Some(Err(format!("unterminated string on line {}", self.line)));
            }
            self.pos += 1;
            Token::Str(&self.src[start + 1..self.pos - 1])
        } else if b"+-*/=<>!(){};,&|".contains(&c) {
            let two = self.src.get(start..start + 2).filter(|s| TWO_CHAR_OPS.contains(s));
            self.pos += if two.is_some() { 2 } else { 1 };
            Token::Op(&self.src[start..self.pos])
        } else {
            self.pos += 1;
            return Some(Err(format!("unexpected {:?} on line {}", c as char, self.line)));
        };
        Some(Ok((self.line, tok)))
    }
}

fn main() {
    let src = "let x = 3.5 * (y + 2); // note\nif x >= 10 && ok { print(\"big\"); } @";
    for t in (Lexer { src, pos: 0, line: 1 }) {
        match t {
            Ok((line, tok)) => println!("{} {:?}", line, tok),
            Err(e) => println!("error: {}", e),
        }
    }
}
