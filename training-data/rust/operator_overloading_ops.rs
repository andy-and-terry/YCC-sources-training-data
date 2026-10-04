use std::ops::{Add, AddAssign, Index, Mul, Neg, Sub};

#[derive(Debug, Clone, Copy, PartialEq)]
struct V2 {
    x: f64,
    y: f64,
}

impl Add for V2 {
    type Output = V2;
    fn add(self, o: V2) -> V2 { V2 { x: self.x + o.x, y: self.y + o.y } }
}
impl Sub for V2 {
    type Output = V2;
    fn sub(self, o: V2) -> V2 { V2 { x: self.x - o.x, y: self.y - o.y } }
}
impl Mul<f64> for V2 {
    type Output = V2;
    fn mul(self, k: f64) -> V2 { V2 { x: self.x * k, y: self.y * k } }
}
impl Neg for V2 {
    type Output = V2;
    fn neg(self) -> V2 { V2 { x: -self.x, y: -self.y } }
}
impl AddAssign for V2 {
    fn add_assign(&mut self, o: V2) { self.x += o.x; self.y += o.y; }
}
impl Index<usize> for V2 {
    type Output = f64;
    fn index(&self, i: usize) -> &f64 { if i == 0 { &self.x } else { &self.y } }
}

fn main() {
    let a = V2 { x: 1.0, y: 2.0 };
    let b = V2 { x: 3.0, y: 4.0 };
    println!("{:?} {:?} {:?} {:?}", a + b, b - a, a * 2.0, -a);
    let mut c = a;
    c += b;
    println!("{:?} {} {}", c, c[0], c[1]);
}
