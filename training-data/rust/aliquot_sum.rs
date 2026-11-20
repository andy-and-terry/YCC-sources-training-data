// Aliquot sum with an enum classification.
use std::cmp::Ordering;

#[derive(Debug)]
enum Kind {
    Perfect,
    Abundant,
    Deficient,
}

fn classify(n: u32) -> (u32, Kind) {
    let a: u32 = (1..n).filter(|d| n % d == 0).sum();
    let kind = match a.cmp(&n) {
        Ordering::Equal => Kind::Perfect,
        Ordering::Greater => Kind::Abundant,
        Ordering::Less => Kind::Deficient,
    };
    (a, kind)
}

fn main() {
    for n in [6, 12, 15, 28] {
        let (a, k) = classify(n);
        println!("{} {} {:?}", n, a, k);
    }
}
