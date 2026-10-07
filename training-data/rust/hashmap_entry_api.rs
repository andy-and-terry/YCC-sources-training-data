use std::collections::HashMap;

fn main() {
    let text = "the quick brown fox jumps over the lazy dog the end";
    let mut counts: HashMap<&str, usize> = HashMap::new();
    for w in text.split_whitespace() {
        *counts.entry(w).or_insert(0) += 1;
    }
    let mut pairs: Vec<_> = counts.iter().collect();
    pairs.sort_by(|a, b| b.1.cmp(a.1).then(a.0.cmp(b.0)));
    println!("{:?}", &pairs[..3]);

    let mut groups: HashMap<usize, Vec<&str>> = HashMap::new();
    for w in text.split_whitespace() {
        groups.entry(w.len()).or_default().push(w);
    }
    println!("{:?}", groups[&5]);

    counts.entry("fox").and_modify(|c| *c += 10).or_insert(1);
    println!("{}", counts["fox"]);
}
