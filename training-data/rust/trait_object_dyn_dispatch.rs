trait Shape {
    fn area(&self) -> f64;
    fn name(&self) -> &str;
}

struct Circle(f64);
struct Rect(f64, f64);

impl Shape for Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * self.0 * self.0
    }
    fn name(&self) -> &str {
        "circle"
    }
}

impl Shape for Rect {
    fn area(&self) -> f64 {
        self.0 * self.1
    }
    fn name(&self) -> &str {
        "rect"
    }
}

fn main() {
    let shapes: Vec<Box<dyn Shape>> = vec![Box::new(Circle(1.5)), Box::new(Rect(2.0, 3.0))];
    for s in &shapes {
        println!("{} {:.2}", s.name(), s.area());
    }
}
