#[derive(Debug, Clone, Copy)]
struct Meters(f64);
#[derive(Debug, Clone, Copy)]
struct Feet(f64);

impl From<Feet> for Meters { fn from(f: Feet) -> Meters { Meters(f.0 * 0.3048) } }
fn total(a: Meters, b: Meters) -> Meters { Meters(a.0 + b.0) }

fn main() { println!("{:?}", total(Meters(1.0), Feet(10.0).into())); }
