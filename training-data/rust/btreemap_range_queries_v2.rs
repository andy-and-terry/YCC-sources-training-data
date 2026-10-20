use std::collections::BTreeMap;
use std::ops::Bound::{Excluded, Included};

fn main() {
    let mut m = BTreeMap::new();
    for (k, v) in [(10, "ten"), (20, "twenty"), (30, "thirty"), (40, "forty")] {
        m.insert(k, v);
    }
    println!("{:?}", m.range(15..=30).collect::<Vec<_>>());
    println!("{:?}", m.range((Excluded(10), Included(30))).map(|(k, _)| *k).collect::<Vec<_>>());
    println!("{:?}", m.range(..25).next_back());
    println!("{:?}", m.range(25..).next());
    println!("{:?} {:?}", m.first_key_value(), m.last_key_value());
    let tail = m.split_off(&30);
    println!("{:?} | {:?}", m.keys().collect::<Vec<_>>(), tail.keys().collect::<Vec<_>>());
    println!("{:?}", m.pop_first());
    *m.entry(99).or_insert("x") = "ninety-nine";
    println!("{:?}", m);
}
