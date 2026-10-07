trait Shape {
    fn area(&self) -> f64;
}

struct Circle {
    radius: f64,
}

struct Square {
    side: f64,
}

impl Shape for Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * self.radius * self.radius
    }
}

impl Shape for Square {
    fn area(&self) -> f64 {
        self.side * self.side
    }
}

// Static dispatch: monomorphized per concrete type at compile time.
fn total_area_static<T: Shape>(shapes: &[T]) -> f64 {
    shapes.iter().map(Shape::area).sum()
}

// Dynamic dispatch: one function works over a heterogeneous
// collection of boxed trait objects, resolved via a vtable at runtime.
fn total_area_dynamic(shapes: &[Box<dyn Shape>]) -> f64 {
    shapes.iter().map(|s| s.area()).sum()
}

fn main() {
    let circles = vec![Circle { radius: 1.0 }, Circle { radius: 2.0 }];
    println!("{:.2}", total_area_static(&circles));

    let mixed: Vec<Box<dyn Shape>> = vec![
        Box::new(Circle { radius: 1.0 }),
        Box::new(Square { side: 3.0 }),
    ];
    println!("{:.2}", total_area_dynamic(&mixed));
}
