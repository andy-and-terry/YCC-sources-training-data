use std::collections::BTreeMap;

#[derive(Debug)]
struct Point {
    x: i32,
    y: i32,
}

#[derive(Debug)]
enum Shape {
    Circle { center: Point, radius: u32 },
    Segment(Point, Point),
}

fn main() {
    let s = Shape::Circle { center: Point { x: 1, y: 2 }, radius: 5 };
    println!("{:?}", s);
    println!("{:#?}", s);
    let seg = Shape::Segment(Point { x: 0, y: 0 }, Point { x: 3, y: 4 });
    println!("{:?}", seg);

    let mut m = BTreeMap::new();
    m.insert("a", vec![1, 2]);
    m.insert("b", vec![]);
    println!("{:#?}", m);
}
