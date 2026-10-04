use std::iter::Peekable;
use std::str::Chars;

#[derive(Debug, PartialEq)]
enum Token {
    Num(f64),
    Ident(String),
    Op(char),
}

// Peekable lets a tokenizer look at the next char without consuming it.
struct Lexer<'a> {
    chars: Peekable<Chars<'a>>,
}

impl<'a> Lexer<'a> {
    fn new(src: &'a str) -> Self {
        Lexer { chars: src.chars().peekable() }
    }
}

impl<'a> Iterator for Lexer<'a> {
    type Item = Token;

    fn next(&mut self) -> Option<Token> {
        while self.chars.next_if(|c| c.is_whitespace()).is_some() {}
        let c = *self.chars.peek()?;
        if c.is_ascii_digit() {
            let mut s = String::new();
            while let Some(d) = self.chars.next_if(|c| c.is_ascii_digit() || *c == '.') {
                s.push(d);
            }
            Some(Token::Num(s.parse().unwrap()))
        } else if c.is_alphabetic() {
            let mut s = String::new();
            while let Some(d) = self.chars.next_if(|c| c.is_alphanumeric() || *c == '_') {
                s.push(d);
            }
            Some(Token::Ident(s))
        } else {
            self.chars.next();
            Some(Token::Op(c))
        }
    }
}

fn main() {
    let tokens: Vec<Token> = Lexer::new("area = width_1 * 3.5 + 2").collect();
    for t in &tokens {
        println!("{:?}", t);
    }
    assert_eq!(tokens.len(), 7);
}
