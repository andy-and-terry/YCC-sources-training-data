use std::ops::Add;

#[derive(Debug, Clone, Copy, PartialEq, PartialOrd)]
struct Meters(f64);

#[derive(Debug, Clone, Copy, PartialEq, PartialOrd)]
struct Feet(f64);

impl From<Feet> for Meters {
    fn from(f: Feet) -> Self {
        Meters(f.0 * 0.3048)
    }
}

impl Add for Meters {
    type Output = Meters;
    fn add(self, o: Meters) -> Meters {
        Meters(self.0 + o.0)
    }
}

fn main() {
    let total = Meters(100.0) + Feet(328.084).into();
    println!("{:.3?}", total);
}
