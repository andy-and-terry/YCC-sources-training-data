use std::collections::HashMap;

fn main() {
    let m: HashMap<&str, usize> = ["one", "three", "five"].iter().map(|s| (*s, s.len())).collect();
    let mut keys: Vec<_> = m.iter().collect();
    keys.sort();
    println!("{:?}", keys);

    let words = ["apple", "avocado", "banana", "blueberry", "cherry"];
    let mut groups: HashMap<char, Vec<&str>> = HashMap::new();
    for w in words {
        groups.entry(w.chars().next().unwrap()).or_default().push(w);
    }
    let mut ks: Vec<_> = groups.keys().copied().collect();
    ks.sort();
    for k in ks {
        println!("{} -> {:?}", k, groups[&k]);
    }

    let total: usize = m.values().sum();
    println!("total len {}", total);
}
