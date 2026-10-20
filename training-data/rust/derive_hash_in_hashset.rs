use std::collections::{HashMap, HashSet};
use std::hash::{Hash, Hasher};

#[derive(Debug, PartialEq, Eq, Hash, Clone, Copy, PartialOrd, Ord)]
struct Point {
    x: i32,
    y: i32,
}

/// Case-insensitive key with a hand-written Hash that agrees with Eq.
#[derive(Debug, Eq)]
struct Name(String);

impl PartialEq for Name {
    fn eq(&self, other: &Self) -> bool {
        self.0.eq_ignore_ascii_case(&other.0)
    }
}

impl Hash for Name {
    fn hash<H: Hasher>(&self, state: &mut H) {
        for b in self.0.bytes() {
            state.write_u8(b.to_ascii_lowercase());
        }
    }
}

fn main() {
    let pts: HashSet<Point> = [Point { x: 1, y: 2 }, Point { x: 1, y: 2 }, Point { x: 0, y: 0 }].into();
    println!("{}", pts.len());
    let mut visits: HashMap<Point, u32> = HashMap::new();
    *visits.entry(Point { x: 3, y: 3 }).or_default() += 1;
    println!("{:?}", visits);
    let names: HashSet<Name> = ["Ann", "ANN", "bob"].iter().map(|s| Name(s.to_string())).collect();
    println!("{}", names.len());
}
