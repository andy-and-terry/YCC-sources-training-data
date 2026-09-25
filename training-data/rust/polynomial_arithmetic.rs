use std::fmt;
use std::ops::{Add, Mul};

#[derive(Clone, Debug, PartialEq)]
struct Poly(Vec<i64>);

impl Poly {
    fn new(mut c: Vec<i64>) -> Self {
        while c.len() > 1 && c.last() == Some(&0) {
            c.pop();
        }
        if c.is_empty() {
            c.push(0);
        }
        Poly(c)
    }

    fn eval(&self, x: i64) -> i64 {
        self.0.iter().rev().fold(0, |acc, &c| acc * x + c)
    }

    fn derivative(&self) -> Poly {
        Poly::new(self.0.iter().enumerate().skip(1).map(|(i, &c)| i as i64 * c).collect())
    }
}

impl Add for &Poly {
    type Output = Poly;
    fn add(self, o: &Poly) -> Poly {
        let n = self.0.len().max(o.0.len());
        Poly::new((0..n).map(|i| self.0.get(i).unwrap_or(&0) + o.0.get(i).unwrap_or(&0)).collect())
    }
}

impl Mul for &Poly {
    type Output = Poly;
    fn mul(self, o: &Poly) -> Poly {
        let mut r = vec![0; self.0.len() + o.0.len() - 1];
        for (i, a) in self.0.iter().enumerate() {
            for (j, b) in o.0.iter().enumerate() {
                r[i + j] += a * b;
            }
        }
        Poly::new(r)
    }
}

impl fmt::Display for Poly {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let terms: Vec<String> = self
            .0
            .iter()
            .enumerate()
            .rev()
            .filter(|(_, &c)| c != 0 || self.0.len() == 1)
            .map(|(i, &c)| match i {
                0 => c.to_string(),
                1 => format!("{}x", c),
                _ => format!("{}x^{}", c, i),
            })
            .collect();
        write!(f, "{}", terms.join(" + "))
    }
}

fn main() {
    let p = Poly::new(vec![1, 1]);
    let cube = &(&p * &p) * &p;
    println!("{} | {} | {}", cube, cube.derivative(), cube.eval(2));
    println!("{}", &Poly::new(vec![-1, 0, 1]) + &Poly::new(vec![1, 0, -1]));
}
