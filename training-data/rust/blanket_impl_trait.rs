use std::fmt::Display;

trait Shout {
    fn shout(&self) -> String;
}

// Blanket implementation: every Display type gets `shout`.
impl<T: Display> Shout for T {
    fn shout(&self) -> String {
        self.to_string().to_uppercase() + "!"
    }
}

trait Area {
    const SIDES: u32;
    fn area(&self) -> f64;
    fn describe(&self) -> String {
        format!("{} sides, area {:.1}", Self::SIDES, self.area())
    }
}

struct Square(f64);
struct Tri(f64, f64);

impl Area for Square {
    const SIDES: u32 = 4;
    fn area(&self) -> f64 { self.0 * self.0 }
}

impl Area for Tri {
    const SIDES: u32 = 3;
    fn area(&self) -> f64 { 0.5 * self.0 * self.1 }
}

fn main() {
    println!("{} {} {}", "hey".shout(), 42.shout(), 1.5.shout());
    println!("{} | {}", Square(2.0).describe(), Tri(3.0, 4.0).describe());
}
