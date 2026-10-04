use std::collections::BTreeMap;
use std::ops::Bound::{Excluded, Included};

// BTreeMap keeps keys sorted, enabling range queries and
// ordered iteration that a HashMap cannot provide.
fn main() {
    let mut prices: BTreeMap<u32, &str> = BTreeMap::new();
    for (k, v) in [(10, "pen"), (25, "mug"), (40, "lamp"), (75, "chair"), (120, "desk")] {
        prices.insert(k, v);
    }

    for (price, name) in prices.range(20..=75) {
        println!("{price}: {name}");
    }

    let below_40 = prices.range(..40).next_back();
    println!("closest below 40: {:?}", below_40);

    let above = prices.range((Excluded(40), Included(200))).next();
    println!("first above 40: {:?}", above);

    println!("first = {:?}", prices.first_key_value());
    println!("last  = {:?}", prices.last_key_value());

    let mut upper = prices.split_off(&50);
    println!("lower keys: {:?}", prices.keys().collect::<Vec<_>>());
    println!("upper keys: {:?}", upper.keys().collect::<Vec<_>>());
    upper.pop_first();
    println!("after pop_first: {:?}", upper);
}
