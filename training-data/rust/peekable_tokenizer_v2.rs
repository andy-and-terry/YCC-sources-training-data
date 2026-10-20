#[derive(Debug, PartialEq)]
enum Token {
    Num(f64),
    Ident(String),
    Op(char),
}

fn tokenize(src: &str) -> Vec<Token> {
    let mut out = Vec::new();
    let mut it = src.chars().peekable();
    while let Some(&c) = it.peek() {
        if c.is_whitespace() {
            it.next();
        } else if c.is_ascii_digit() || c == '.' {
            let mut s = String::new();
            while let Some(&d) = it.peek() {
                if d.is_ascii_digit() || d == '.' {
                    s.push(d);
                    it.next();
                } else {
                    break;
                }
            }
            out.push(Token::Num(s.parse().unwrap()));
        } else if c.is_alphabetic() || c == '_' {
            let mut s = String::new();
            while let Some(d) = it.next_if(|d| d.is_alphanumeric() || *d == '_') {
                s.push(d);
            }
            out.push(Token::Ident(s));
        } else {
            out.push(Token::Op(c));
            it.next();
        }
    }
    out
}

fn main() {
    println!("{:?}", tokenize("x1 = 3.5*(y_2 + 10)"));
}
