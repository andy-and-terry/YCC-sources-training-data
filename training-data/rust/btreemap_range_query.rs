use std::collections::BTreeMap;
use std::ops::Bound::{Excluded, Included, Unbounded};

fn main() {
    let mut scores: BTreeMap<u32, &str> = BTreeMap::new();
    for (k, v) in [(10, "ten"), (20, "twenty"), (30, "thirty"), (40, "forty"), (50, "fifty")] {
        scores.insert(k, v);
    }

    println!("keys in order: {:?}", scores.keys().collect::<Vec<_>>());
    println!("range 20..40: {:?}", scores.range(20..40).collect::<Vec<_>>());
    println!("range ..=30: {:?}", scores.range(..=30).map(|(k, _)| *k).collect::<Vec<_>>());
    println!(
        "range (20, 50]: {:?}",
        scores.range((Excluded(20), Included(50))).map(|(k, _)| *k).collect::<Vec<_>>()
    );

    let floor = scores.range(..=35).next_back();
    let ceil = scores.range((Included(35), Unbounded)).next();
    println!("floor(35)={:?} ceil(35)={:?}", floor, ceil);

    println!("first={:?} last={:?}", scores.first_key_value(), scores.last_key_value());
    let tail = scores.split_off(&30);
    println!("left={:?} right={:?}", scores.keys().collect::<Vec<_>>(), tail.keys().collect::<Vec<_>>());
}
