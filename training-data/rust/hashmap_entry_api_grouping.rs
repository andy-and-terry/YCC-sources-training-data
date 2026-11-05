use std::collections::HashMap;

fn main() {
    let words = ["apple", "avocado", "banana", "blueberry", "cherry"];
    let mut groups: HashMap<char, Vec<&str>> = HashMap::new();
    for w in words {
        groups.entry(w.chars().next().unwrap()).or_default().push(w);
    }
    let mut keys: Vec<_> = groups.keys().copied().collect();
    keys.sort();
    for k in keys {
        println!("{} {:?}", k, groups[&k]);
    }
}
