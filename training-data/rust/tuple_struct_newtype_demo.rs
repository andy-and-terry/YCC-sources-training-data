use std::fmt;

// Newtype pattern: wrap a primitive to get distinct types and custom impls.
struct Meters(f64);
struct Feet(f64);

impl From<Feet> for Meters {
    fn from(f: Feet) -> Self {
        Meters(f.0 * 0.3048)
    }
}

impl fmt::Display for Meters {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:.2} m", self.0)
    }
}

// Tuple struct with multiple fields
#[derive(Debug, Clone, Copy, PartialEq)]
struct Rgb(u8, u8, u8);

impl Rgb {
    fn hex(&self) -> String {
        format!("#{:02x}{:02x}{:02x}", self.0, self.1, self.2)
    }
}

// Newtype to implement a foreign trait for a foreign type
struct Wrapper(Vec<String>);

impl fmt::Display for Wrapper {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "[{}]", self.0.join(", "))
    }
}

fn main() {
    let m: Meters = Feet(100.0).into();
    println!("{}", m);

    let c = Rgb(255, 128, 0);
    let Rgb(r, g, b) = c; // destructure
    println!("{:?} -> {} ({}, {}, {})", c, c.hex(), r, g, b);

    let w = Wrapper(vec!["a".to_string(), "b".to_string()]);
    println!("{}", w);
}
