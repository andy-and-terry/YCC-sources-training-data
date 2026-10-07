use std::collections::BTreeMap;

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
enum Kind {
    Deficient,
    Perfect,
    Abundant,
}

fn divisor_sums(limit: usize) -> Vec<usize> {
    let mut s = vec![0; limit + 1];
    for d in 1..=limit / 2 {
        for m in (2 * d..=limit).step_by(d) {
            s[m] += d;
        }
    }
    s
}

fn main() {
    let limit = 100_000;
    let s = divisor_sums(limit);
    let mut counts = BTreeMap::new();
    for n in 2..=limit {
        let kind = match s[n].cmp(&n) {
            std::cmp::Ordering::Less => Kind::Deficient,
            std::cmp::Ordering::Equal => Kind::Perfect,
            std::cmp::Ordering::Greater => Kind::Abundant,
        };
        *counts.entry(kind).or_insert(0) += 1;
    }
    let perfect: Vec<usize> = (2..=limit).filter(|&n| s[n] == n).collect();
    println!("perfect: {:?}", perfect);
    println!("{:?}", counts);
}
