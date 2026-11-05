use std::cmp::Reverse;
use std::collections::BinaryHeap;

fn main() {
    let mut h = BinaryHeap::new();
    for x in [5, 1, 8, 3] {
        h.push(Reverse(x));
    }
    while let Some(Reverse(x)) = h.pop() {
        print!("{} ", x);
    }
    println!();
}
