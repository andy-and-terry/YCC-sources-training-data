trait Shape {
    fn area(&self) -> f64;
}
struct Sq(f64);
struct Circle(f64);
impl Shape for Sq {
    fn area(&self) -> f64 { self.0 * self.0 }
}
impl Shape for Circle {
    fn area(&self) -> f64 { std::f64::consts::PI * self.0 * self.0 }
}

fn main() {
    let shapes: Vec<Box<dyn Shape>> = vec![Box::new(Sq(2.0)), Box::new(Circle(1.0))];
    for s in &shapes {
        println!("{:.2}", s.area());
    }
}
