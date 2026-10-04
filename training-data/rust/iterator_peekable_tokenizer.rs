use std::iter::Peekable;
use std::str::Chars;

#[derive(Debug)]
enum Token {
    Num(i64),
    Op(char),
}

fn tokenize(src: &str) -> Vec<Token> {
    let mut it: Peekable<Chars> = src.chars().peekable();
    let mut out = Vec::new();
    while let Some(&c) = it.peek() {
        if c.is_ascii_digit() {
            let mut n = 0i64;
            while let Some(&d) = it.peek() {
                if let Some(v) = d.to_digit(10) {
                    n = n * 10 + v as i64;
                    it.next();
                } else {
                    break;
                }
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
