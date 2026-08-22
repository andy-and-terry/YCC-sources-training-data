use std::ops::Add;

#[derive(Debug, Clone, Copy, PartialEq)]
struct Meters(f64);

#[derive(Debug, Clone, Copy, PartialEq)]
struct Feet(f64);

impl From<Feet> for Meters {
    fn from(feet: Feet) -> Self {
        Meters(feet.0 * 0.3048)
    }
}

impl Add for Meters {
    type Output = Meters;
    fn add(self, other: Meters) -> Meters {
        Meters(self.0 + other.0)
    }
}

fn main() {
    let height_ft = Feet(6.0);
    let height_m: Meters = height_ft.into();
    println!("{:?}", height_m);

    let total = Meters(1.5) + Meters(2.5);
    println!("{:?}", total);
}
