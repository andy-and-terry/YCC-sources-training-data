use std::collections::HashMap;

fn main() {
    let text = "one two three two three three";
    let mut counts: HashMap<&str, usize> = HashMap::new();
    for w in text.split_whitespace() {
        *counts.entry(w).or_insert(0) += 1;
    }
    let mut pairs: Vec<_> = counts.iter().collect();
    pairs.sort_by(|a, b| b.1.cmp(a.1).then(a.0.cmp(b.0)));
    println!("{:?}", pairs);

    let mut groups: HashMap<usize, Vec<&str>> = HashMap::new();
    for w in text.split_whitespace() {
        groups.entry(w.len()).or_default().push(w);
    }
    let mut keys: Vec<_> = groups.keys().copied().collect();
    keys.sort();
    for k in keys {
        println!("{} -> {:?}", k, groups[&k]);
    }

    counts.entry("one").and_modify(|c| *c += 10).or_insert(1);
    println!("{}", counts["one"]);
}
