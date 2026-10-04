use std::cmp::Reverse;
use std::collections::BinaryHeap;

#[derive(Debug, PartialEq, Eq, PartialOrd, Ord)]
struct Task {
    priority: u32,
    name: String,
}

fn main() {
    let mut max_heap = BinaryHeap::new();
    for n in [5, 1, 8, 3, 9, 2] {
        max_heap.push(n);
    }
    println!("max: {:?}", max_heap.peek());

    let mut min_heap = BinaryHeap::new();
    for n in [5, 1, 8, 3, 9, 2] {
        min_heap.push(Reverse(n));
    }
    let mut out = Vec::new();
    while let Some(Reverse(n)) = min_heap.pop() {
        out.push(n);
    }
    println!("ascending: {:?}", out);

    let mut tasks = BinaryHeap::new();
    tasks.push(Task { priority: 2, name: "write".into() });
    tasks.push(Task { priority: 9, name: "deploy".into() });
    tasks.push(Task { priority: 5, name: "test".into() });
    while let Some(Task { priority, name }) = tasks.pop() {
        println!("{} ({})", name, priority);
    }

    let top3: Vec<i32> = {
        let mut h: BinaryHeap<i32> = vec![4, 10, 7, 1, 12].into();
        (0..3).filter_map(|_| h.pop()).collect()
    };
    println!("top3: {:?}", top3);
}
