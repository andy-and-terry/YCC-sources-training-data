use std::cmp::Reverse;
use std::collections::BinaryHeap;

fn top_k(xs: &[i32], k: usize) -> Vec<i32> {
    let mut h = BinaryHeap::new();
    for &x in xs {
        h.push(Reverse(x));
        if h.len() > k { h.pop(); }
    }
    let mut v: Vec<_> = h.into_iter().map(|Reverse(x)| x).collect();
    v.sort_by(|a, b| b.cmp(a));
    v
}

fn main() {
    println!("{:?}", top_k(&[5, 1, 9, 3, 7, 8], 3));
}
