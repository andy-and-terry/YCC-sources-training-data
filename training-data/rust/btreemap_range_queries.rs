use std::collections::BTreeMap;
use std::ops::Bound::{Excluded, Included};

fn main() {
    let mut m = BTreeMap::new();
    for (k, v) in [(10, "a"), (20, "b"), (30, "c"), (40, "d")] {
        m.insert(k, v);
    }
    println!("{:?}", m.range(15..=30).collect::<Vec<_>>());
    println!("{:?}", m.range((Excluded(10), Included(30))).collect::<Vec<_>>());
    // floor / ceiling lookups
    println!("floor(25) = {:?}", m.range(..=25).next_back());
    println!("ceil(25) = {:?}", m.range(25..).next());
    println!("first = {:?}, last = {:?}", m.first_key_value(), m.last_key_value());
}
