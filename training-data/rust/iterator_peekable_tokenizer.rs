use std::iter::Peekable;
use std::str::Chars;

#[derive(Debug, PartialEq)]
enum Token {
    Num(u32),
    Op(char),
}

fn tokenize(src: &str) -> Vec<Token> {
    let mut it: Peekable<Chars> = src.chars().peekable();
    let mut out = Vec::new();
    while let Some(&c) = it.peek() {
        if c.is_ascii_digit() {
            let mut n = 0;
            while let Some(d) = it.next_if(|ch| ch.is_ascii_digit()) {
                n = n * 10 + d.to_digit(10).unwrap();
            }
            out.push(Token::Num(n));
        } else if c.is_whitespace() {
            it.next();
        } else {
            out.push(Token::Op(c));
            it.next();
        }
    }
    out
}

fn main() {
    println!("{:?}", tokenize("12 + 345*(6-7)"));
}
