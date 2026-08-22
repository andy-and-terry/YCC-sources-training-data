trait Shape {
    fn area(&self) -> f64;
}

struct Circle {
    radius: f64,
}

impl Shape for Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * self.radius * self.radius
    }
}

struct Square {
    side: f64,
}

impl Shape for Square {
    fn area(&self) -> f64 {
        self.side * self.side
    }
}

fn shape_factory(kind: &str, param: f64) -> Box<dyn Shape> {
    match kind {
        "circle" => Box::new(Circle { radius: param }),
        "square" => Box::new(Square { side: param }),
        _ => panic!("unknown shape: {}", kind),
    }
}

fn main() {
    println!("{}", shape_factory("circle", 2.0).area());
    println!("{}", shape_factory("square", 3.0).area());
}
