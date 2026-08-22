use std::collections::BinaryHeap;
use std::cmp::Reverse;

fn main() {
    let mut pq: BinaryHeap<Reverse<(i32, &str)>> = BinaryHeap::new();
    pq.push(Reverse((5, "low")));
    pq.push(Reverse((1, "high")));
    pq.push(Reverse((3, "medium")));
    while let Some(Reverse((_, item))) = pq.pop() {
        println!("{}", item);
    }
}
