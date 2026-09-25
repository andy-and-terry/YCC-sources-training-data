use std::collections::HashMap;

#[derive(Debug)]
enum Expr {
    Num(f64),
    Var(String),
    Neg(Box<Expr>),
    Bin(char, Box<Expr>, Box<Expr>),
}

impl Expr {
    fn eval(&self, env: &HashMap<&str, f64>) -> Result<f64, String> {
        Ok(match self {
            Expr::Num(v) => *v,
            Expr::Var(n) => *env.get(n.as_str()).ok_or(format!("unbound variable {}", n))?,
            Expr::Neg(e) => -e.eval(env)?,
            Expr::Bin(op, l, r) => {
                let (a, b) = (l.eval(env)?, r.eval(env)?);
                match op {
                    '+' => a + b,
                    '-' => a - b,
                    '*' => a * b,
                    '/' => a / b,
                    _ => a.powf(b),
                }
            }
        })
    }
}

struct Parser<'a> {
    chars: std::iter::Peekable<std::str::Chars<'a>>,
}

impl<'a> Parser<'a> {
    fn peek(&mut self) -> Option<char> {
        while self.chars.peek() == Some(&' ') {
            self.chars.next();
        }
        self.chars.peek().copied()
    }

    fn expr(&mut self) -> Result<Expr, String> {
        let mut e = self.term()?;
        while let Some(op @ ('+' | '-')) = self.peek() {
            self.chars.next();
            e = Expr::Bin(op, Box::new(e), Box::new(self.term()?));
        }
        Ok(e)
    }

    fn term(&mut self) -> Result<Expr, String> {
        let mut e = self.power()?;
        while let Some(op @ ('*' | '/')) = self.peek() {
            self.chars.next();
            e = Expr::Bin(op, Box::new(e), Box::new(self.power()?));
        }
        Ok(e)
    }

    fn power(&mut self) -> Result<Expr, String> {
        let base = self.unary()?;
        if self.peek() == Some('^') {
            self.chars.next();
            return Ok(Expr::Bin('^', Box::new(base), Box::new(self.power()?)));
        }
        Ok(base)
    }

    fn unary(&mut self) -> Result<Expr, String> {
        if self.peek() == Some('-') {
            self.chars.next();
            return Ok(Expr::Neg(Box::new(self.unary()?)));
        }
        self.primary()
    }

    fn primary(&mut self) -> Result<Expr, String> {
        match self.peek() {
            Some('(') => {
                self.chars.next();
                let e = self.expr()?;
                if self.peek() != Some(')') {
                    return Err("expected ')'".into());
                }
                self.chars.next();
                Ok(e)
            }
            Some(c) if c.is_ascii_alphabetic() => {
                let mut name = String::new();
                while let Some(&c) = self.chars.peek().filter(|c| c.is_ascii_alphanumeric()) {
                    name.push(c);
                    self.chars.next();
                }
                Ok(Expr::Var(name))
            }
            Some(c) if c.is_ascii_digit() => {
                let mut s = String::new();
                while let Some(&c) = self.chars.peek().filter(|c| c.is_ascii_digit() || **c == '.') {
                    s.push(c);
                    self.chars.next();
                }
                s.parse().map(Expr::Num).map_err(|e| e.to_string())
            }
            other => Err(format!("unexpected {:?}", other)),
        }
    }
}

fn parse(s: &str) -> Result<Expr, String> {
    let mut p = Parser { chars: s.chars().peekable() };
    let e = p.expr()?;
    match p.peek() {
        None => Ok(e),
        Some(c) => Err(format!("trailing {:?}", c)),
    }
}

fn main() {
    let env = HashMap::from([("x", 2.0), ("y", 4.0)]);
    for src in ["1 + 2 * 3", "2 ^ 3 ^ 2", "-(x + 3) * y", "(1 + 2", "z * 2", "3 3"] {
        println!("{:14} => {:?}", src, parse(src).and_then(|e| e.eval(&env)));
    }
}
