use std::collections::BTreeMap;

fn modes(items: &[i32]) -> Vec<i32> {
    let mut counts = BTreeMap::new();
    for &x in items {
        *counts.entry(x).or_insert(0) += 1;
    }
    let top = counts.values().copied().max().unwrap_or(0);
    counts.into_iter().filter(|&(_, c)| c == top).map(|(k, _)| k).collect()
}

fn main() {
    println!("{:?}", modes(&[1, 2, 2, 3, 3, 4]));
}
