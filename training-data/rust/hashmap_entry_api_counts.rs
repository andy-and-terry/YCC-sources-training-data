use std::collections::HashMap;

fn main() {
    let mut counts: HashMap<char, usize> = HashMap::new();
    for c in "hello world".chars().filter(|c| c.is_alphabetic()) {
        *counts.entry(c).or_insert(0) += 1;
    }
    let mut v: Vec<_> = counts.into_iter().collect();
    v.sort_by(|a, b| b.1.cmp(&a.1).then(a.0.cmp(&b.0)));
    println!("{:?}", &v[..3]);
    let mut groups: HashMap<usize, Vec<&str>> = HashMap::new();
    for w in ["a", "bb", "cc", "d"] { groups.entry(w.len()).or_default().push(w); }
    println!("{:?}", groups[&2]);
}
