use std::cmp::Ordering;
use std::fmt;
use std::ops::{Add, Div, Mul, Sub};

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
struct Frac {
    n: i64,
    d: i64,
}

fn gcd(a: i64, b: i64) -> i64 {
    if b == 0 { a.abs() } else { gcd(b, a % b) }
}

impl Frac {
    fn new(n: i64, d: i64) -> Self {
        assert!(d != 0, "zero denominator");
        let s = if d < 0 { -1 } else { 1 };
        let g = gcd(n, d).max(1);
        Frac { n: s * n / g, d: s * d / g }
    }
}

impl Add for Frac {
    type Output = Frac;
    fn add(self, o: Frac) -> Frac { Frac::new(self.n * o.d + o.n * self.d, self.d * o.d) }
}
impl Sub for Frac {
    type Output = Frac;
    fn sub(self, o: Frac) -> Frac { Frac::new(self.n * o.d - o.n * self.d, self.d * o.d) }
}
impl Mul for Frac {
    type Output = Frac;
    fn mul(self, o: Frac) -> Frac { Frac::new(self.n * o.n, self.d * o.d) }
}
impl Div for Frac {
    type Output = Frac;
    fn div(self, o: Frac) -> Frac { Frac::new(self.n * o.d, self.d * o.n) }
}
impl PartialOrd for Frac {
    fn partial_cmp(&self, o: &Frac) -> Option<Ordering> { Some(self.cmp(o)) }
}
impl Ord for Frac {
    fn cmp(&self, o: &Frac) -> Ordering { (self.n * o.d).cmp(&(o.n * self.d)) }
}
impl fmt::Display for Frac {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        if self.d == 1 { write!(f, "{}", self.n) } else { write!(f, "{}/{}", self.n, self.d) }
    }
}

fn main() {
    let (a, b) = (Frac::new(1, 3), Frac::new(1, 6));
    println!("{} {} {} {} {}", a + b, a - b, a * b, a / b, a > b);
    let h = (1..=20).map(|k| Frac::new(1, k)).fold(Frac::new(0, 1), |acc, x| acc + x);
    println!("H(20) = {}", h);
    let mut v = vec![Frac::new(3, 4), Frac::new(-1, 2), Frac::new(2, 3), Frac::new(5, 8)];
    v.sort();
    println!("{}", v.iter().map(|f| f.to_string()).collect::<Vec<_>>().join(" < "));
}
