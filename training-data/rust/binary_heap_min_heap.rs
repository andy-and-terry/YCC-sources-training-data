use std::cmp::Reverse;
use std::collections::BinaryHeap;

#[derive(Debug, PartialEq, Eq, PartialOrd, Ord)]
struct Task {
    priority: u32,
    name: String,
}

// BinaryHeap is a max-heap; wrap values in Reverse for min-heap behaviour.
fn k_smallest(items: &[i32], k: usize) -> Vec<i32> {
    let mut heap = BinaryHeap::new();
    for &x in items {
        heap.push(x);
        if heap.len() > k {
            heap.pop();
        }
    }
    heap.into_sorted_vec()
}

fn main() {
    let mut min_heap = BinaryHeap::new();
    for x in [5, 1, 8, 3, 2] {
        min_heap.push(Reverse(x));
    }
    while let Some(Reverse(x)) = min_heap.pop() {
        print!("{x} ");
    }
    println!();

    let mut tasks = BinaryHeap::new();
    tasks.push(Task { priority: 2, name: "write".into() });
    tasks.push(Task { priority: 9, name: "deploy".into() });
    tasks.push(Task { priority: 5, name: "review".into() });
    println!("peek: {:?}", tasks.peek().map(|t| &t.name));
    while let Some(t) = tasks.pop() {
        println!("{} ({})", t.name, t.priority);
    }

    println!("{:?}", k_smallest(&[9, 4, 7, 1, 8, 2], 3));
}
