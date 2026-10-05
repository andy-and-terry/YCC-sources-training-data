use std::cmp::Reverse;
use std::collections::BinaryHeap;

fn k_smallest(nums: &[i32], k: usize) -> Vec<i32> {
    let mut heap = BinaryHeap::new();
    for &n in nums {
        heap.push(n);
        if heap.len() > k {
            heap.pop(); // drop the largest
        }
    }
    let mut out = heap.into_vec();
    out.sort();
    out
}

fn main() {
    let mut min_heap = BinaryHeap::new();
    for x in [5, 1, 8, 3, 2] {
        min_heap.push(Reverse(x));
    }
    while let Some(Reverse(x)) = min_heap.pop() {
        print!("{} ", x);
    }
    println!();
    println!("{:?}", k_smallest(&[9, 4, 7, 1, 8, 2, 6], 3));
}
