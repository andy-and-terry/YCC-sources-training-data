use std::fmt::Display;

trait Shape {
    fn area(&self) -> f64;
    fn name(&self) -> String;
}

struct Circle(f64);
struct Rect(f64, f64);

impl Shape for Circle {
    fn area(&self) -> f64 { std::f64::consts::PI * self.0 * self.0 }
    fn name(&self) -> String { "circle".into() }
}
impl Shape for Rect {
    fn area(&self) -> f64 { self.0 * self.1 }
    fn name(&self) -> String { "rect".into() }
}

// Generic (monomorphized) vs. dyn (vtable) dispatch.
fn report_static<T: Shape>(s: &T) -> String { format!("{} {:.2}", s.name(), s.area()) }
fn report_dyn(s: &dyn Shape) -> String { format!("{} {:.2}", s.name(), s.area()) }
fn show_all<T: Display>(items: &[T]) { for i in items { print!("{i} "); } println!(); }

fn main() {
    println!("{}", report_static(&Circle(1.0)));
    let shapes: Vec<Box<dyn Shape>> = vec![Box::new(Rect(2.0, 3.0)), Box::new(Circle(2.0))];
    for s in &shapes { println!("{}", report_dyn(s.as_ref())); }
    show_all(&[1, 2, 3]);
}
