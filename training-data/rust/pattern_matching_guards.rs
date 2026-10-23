enum Shape {
    Circle(f64),
    Rect { w: f64, h: f64 },
}

fn classify(n: i32) -> &'static str {
    match n {
        i32::MIN..=-1 => "negative",
        0 => "zero",
        x if x % 2 == 0 => "even",
        1 | 3 | 5 | 7 | 9 => "small odd",
        _ => "odd",
    }
}

fn main() {
    for n in [-3, 0, 4, 7, 11] {
        println!("{} {}", n, classify(n));
    }
    let shapes = [Shape::Circle(1.0), Shape::Rect { w: 2.0, h: 3.0 }];
    for s in &shapes {
        let a = match s {
            Shape::Circle(r) => 3.14 * r * r,
            Shape::Rect { w, h } => w * h,
        };
        println!("{:.2}", a);
    }
    if let Some(x @ 1..=5) = Some(3) {
        println!("in range {}", x);
    }
}
