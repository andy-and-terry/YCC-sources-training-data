use std::collections::HashMap;

fn main() {
    let mut counts: HashMap<&str, usize> = HashMap::new();
    for w in "a b a c b a".split_whitespace() {
        *counts.entry(w).or_insert(0) += 1;
    }
    let mut v: Vec<_> = counts.into_iter().collect();
    v.sort();
    println!("{:?}", v);
}
