#[derive(Debug)]
enum Token {
    Num(i64),
    Op(char),
    LParen,
    RParen,
}

fn main() {
    let toks = vec![Token::LParen, Token::Num(4), Token::Op('+'), Token::Num(-2), Token::RParen];
    let nums = toks.iter().filter(|t| matches!(t, Token::Num(_))).count();
    let parens = toks.iter().filter(|t| matches!(t, Token::LParen | Token::RParen)).count();
    let big = toks.iter().any(|t| matches!(t, Token::Num(n) if *n > 3));
    println!("nums={} parens={} has>3: {}", nums, parens, big);

    let c = 'x';
    println!("{}", matches!(c, 'a'..='z'));
    assert!(matches!(toks[2], Token::Op('+' | '-')));
}
