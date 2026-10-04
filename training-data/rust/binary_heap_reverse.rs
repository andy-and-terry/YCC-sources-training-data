use std::cmp::Reverse;
use std::collections::BinaryHeap;

#[derive(Debug, PartialEq, Eq, PartialOrd, Ord)]
struct Task {
    priority: u32,
    name: String,
}

fn main() {
    let mut max_heap = BinaryHeap::new();
    for x in [5, 1, 8, 3] {
        max_heap.push(x);
    }
    println!("{:?}", max_heap.peek());

    let mut min_heap = BinaryHeap::new();
    for x in [5, 1, 8, 3] {
        min_heap.push(Reverse(x));
    }
    while let Some(Reverse(x)) = min_heap.pop() {
        print!("{} ", x);
    }
    println!();

    let mut tasks = BinaryHeap::new();
    tasks.push(Task { priority: 2, name: "write".into() });
    tasks.push(Task { priority: 9, name: "ship".into() });
    tasks.push(Task { priority: 5, name: "test".into() });
    println!("{:?}", tasks.pop().map(|t| t.name));
    println!("{:?}", tasks.into_sorted_vec().iter().map(|t| t.priority).collect::<Vec<_>>());
}
