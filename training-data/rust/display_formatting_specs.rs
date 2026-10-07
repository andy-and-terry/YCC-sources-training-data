use std::fmt;

struct Point {
    x: f64,
    y: f64,
}

impl fmt::Display for Point {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if let Some(p) = f.precision() {
            write!(f, "({:.*}, {:.*})", p, self.x, p, self.y)
        } else {
            write!(f, "({}, {})", self.x, self.y)
        }
    }
}

impl fmt::Debug for Point {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_struct("Point").field("x", &self.x).field("y", &self.y).finish()
    }
}

fn main() {
    let p = Point { x: 1.0, y: 2.5 };
    println!("{}", p);
    println!("{:.2}", p);
    println!("{:?}", p);
    println!("{:#?}", p);

    println!("[{:>8}] [{:<8}] [{:^8}]", "r", "l", "c");
    println!("[{:*^9}] [{:->6}]", "mid", 42);
    println!("{:08.3} {:+} {:e}", 3.14159, 7, 1500.0);
    println!("{:#x} {:#b} {:#o} {:X}", 255, 5, 8, 255);
    println!("{0} {1} {0} {name}", "a", "b", name = "n");
    let width = 6;
    println!("[{:>width$}] [{:>1$}] [{:.*}]", 1, 4, 2, 1.23456);
    println!("{:?} {:?}", "quote\"d", 'c');
}
