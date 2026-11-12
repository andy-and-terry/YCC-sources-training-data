#[derive(Debug)]
enum Token { Num(i32), Plus, Minus }

fn main() {
    let ts = vec![Token::Num(1), Token::Plus, Token::Num(2), Token::Minus];
    let ops = ts.iter().filter(|t| matches!(t, Token::Plus | Token::Minus)).count();
    println!("ops={}", ops);
    if let Some(Token::Num(n)) = ts.first() { println!("first={}", n); }
}
