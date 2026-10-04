use std::collections::{BTreeMap, HashMap};

fn main() {
    let text = "one two two three three three";
    let mut counts: HashMap<&str, usize> = HashMap::new();
    for w in text.split(' ') {
        *counts.entry(w).or_insert(0) += 1;
    }
    let mut pairs: Vec<_> = counts.iter().collect();
    pairs.sort_by(|a, b| b.1.cmp(a.1).then(a.0.cmp(b.0)));
    println!("{:?}", pairs);

    let mut groups: HashMap<usize, Vec<&str>> = HashMap::new();
    for w in ["a", "bb", "cc", "d"] {
        groups.entry(w.len()).or_default().push(w);
    }
    let sorted: BTreeMap<_, _> = groups.into_iter().collect();
    println!("{:?}", sorted);

    let mut m: HashMap<&str, i32> = HashMap::new();
    m.entry("x").and_modify(|v| *v += 1).or_insert(1);
    m.entry("x").and_modify(|v| *v += 1).or_insert(1);
    println!("{:?}", m);
    if let Some(v) = m.remove("x") {
        println!("removed {}", v);
    }
    println!("{}", m.contains_key("x"));
}
