use std::collections::BinaryHeap;
use std::cmp::Reverse;

fn kth_largest(nums: &[i32], k: usize) -> i32 {
    let mut heap = BinaryHeap::new();
    for &num in nums {
        heap.push(Reverse(num));
        if heap.len() > k {
            heap.pop();
        }
    }
    heap.peek().unwrap().0
}

fn main() {
    println!("{}", kth_largest(&[3, 2, 1, 5, 6, 4], 2));
}
