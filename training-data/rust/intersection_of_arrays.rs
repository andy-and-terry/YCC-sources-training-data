use std::collections::{BTreeSet, HashMap};

fn intersect_unique(a: &[i32], b: &[i32]) -> BTreeSet<i32> {
    let sa: BTreeSet<_> = a.iter().copied().collect();
    let sb: BTreeSet<_> = b.iter().copied().collect();
    &sa & &sb
}

fn intersect_multiset(a: &[i32], b: &[i32]) -> Vec<i32> {
    let mut counts: HashMap<i32, usize> = HashMap::new();
    for &x in a {
        *counts.entry(x).or_default() += 1;
    }
    b.iter()
        .filter(|x| match counts.get_mut(x) {
            Some(c) if *c > 0 => {
                *c -= 1;
                true
            }
            _ => false,
        })
        .copied()
        .collect()
}

fn main() {
    let (a, b) = ([4, 9, 5, 4, 4], [9, 4, 9, 8, 4]);
    println!("{:?} {:?}", intersect_unique(&a, &b), intersect_multiset(&a, &b));
}
