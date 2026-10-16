trait Shape {
    const SIDES: u32;
    fn name(&self) -> &'static str;
    fn describe(&self) -> String {
        format!("{} has {} sides", self.name(), Self::SIDES)
    }
}

struct Triangle;
struct Square;

impl Shape for Triangle {
    const SIDES: u32 = 3;
    fn name(&self) -> &'static str { "triangle" }
}
impl Shape for Square {
    const SIDES: u32 = 4;
    fn name(&self) -> &'static str { "square" }
}

struct Circle;
impl Circle {
    const PI_ISH: f64 = 3.14159;
    fn area(r: f64) -> f64 { Self::PI_ISH * r * r }
}

fn main() {
    println!("{}", Triangle.describe());
    println!("{}", Square.describe());
    println!("{:.2}", Circle::area(2.0));
    println!("total sides = {}", Triangle::SIDES + Square::SIDES);
}
