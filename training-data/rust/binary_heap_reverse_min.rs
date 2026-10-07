use std::cmp::Reverse;
use std::collections::BinaryHeap;

fn main() {
    let mut max_heap = BinaryHeap::from(vec![3, 1, 4, 1, 5]);
    println!("{:?}", max_heap.pop());

    let mut min_heap = BinaryHeap::new();
    for x in [5, 2, 8, 1] {
        min_heap.push(Reverse(x));
    }
    while let Some(Reverse(x)) = min_heap.pop() {
        print!("{} ", x);
    }
    println!();

    // Tuples order lexicographically: (priority, name)
    let mut tasks = BinaryHeap::new();
    tasks.push((2, "write"));
    tasks.push((9, "deploy"));
    tasks.push((5, "test"));
    println!("{:?}", tasks.into_sorted_vec());
}
