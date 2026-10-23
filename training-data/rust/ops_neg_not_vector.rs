use std::ops::{Neg, Not};

#[derive(Debug, Clone, Copy, PartialEq)]
struct Vec2 {
    x: f64,
    y: f64,
}

impl Neg for Vec2 {
    type Output = Vec2;
    fn neg(self) -> Vec2 {
        Vec2 { x: -self.x, y: -self.y }
    }
}

#[derive(Debug, Clone, Copy, PartialEq)]
struct Flags(u8);

impl Not for Flags {
    type Output = Flags;
    fn not(self) -> Flags {
        Flags(!self.0)
    }
}

fn main() {
    let v = Vec2 { x: 1.5, y: -2.0 };
    println!("{:?}", -v);
    println!("{}", -(-v) == v);

    let f = Flags(0b0000_1111);
    println!("{:08b}", (!f).0);
}
