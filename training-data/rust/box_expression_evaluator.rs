use std::fmt;

// A recursive enum needs Box to give it a known size.
enum Expr {
    Num(f64),
    Neg(Box<Expr>),
    Bin(Box<Expr>, char, Box<Expr>),
}

use Expr::*;

fn eval(e: &Expr) -> Result<f64, String> {
    Ok(match e {
        Num(n) => *n,
        Neg(inner) => -eval(inner)?,
        Bin(l, op, r) => {
            let (a, b) = (eval(l)?, eval(r)?);
            match op {
                '+' => a + b,
                '-' => a - b,
                '*' => a * b,
                '/' if b == 0.0 => return Err("division by zero".to_string()),
                '/' => a / b,
                other => return Err(format!("unknown operator {other}")),
            }
        }
    })
}

impl fmt::Display for Expr {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Num(n) => write!(f, "{n}"),
            Neg(e) => write!(f, "-{e}"),
            Bin(l, op, r) => write!(f, "({l} {op} {r})"),
        }
    }
}

fn bin(l: Expr, op: char, r: Expr) -> Expr {
    Bin(Box::new(l), op, Box::new(r))
}

fn main() {
    let e = bin(bin(Num(2.0), '+', Num(3.0)), '*', Neg(Box::new(Num(4.0))));
    println!("{} = {:?}", e, eval(&e));
    let bad = bin(Num(1.0), '/', bin(Num(2.0), '-', Num(2.0)));
    println!("{} = {:?}", bad, eval(&bad));
    println!("{:?}", eval(&bin(Num(1.0), '%', Num(2.0))));
}
