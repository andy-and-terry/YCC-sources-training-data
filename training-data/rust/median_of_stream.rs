use std::collections::BinaryHeap;
use std::cmp::Reverse;

struct MedianFinder {
    small: BinaryHeap<i32>,
    large: BinaryHeap<Reverse<i32>>,
}

impl MedianFinder {
    fn new() -> Self {
        MedianFinder { small: BinaryHeap::new(), large: BinaryHeap::new() }
    }

    fn add_num(&mut self, num: i32) {
        self.small.push(num);
        if let Some(top) = self.small.pop() {
            self.large.push(Reverse(top));
        }
        if self.large.len() > self.small.len() {
            if let Some(Reverse(top)) = self.large.pop() {
                self.small.push(top);
            }
        }
    }

    fn find_median(&self) -> f64 {
        if self.small.len() > self.large.len() {
            *self.small.peek().unwrap() as f64
        } else {
            (*self.small.peek().unwrap() as f64 + self.large.peek().unwrap().0 as f64) / 2.0
        }
    }
}

fn main() {
    let mut mf = MedianFinder::new();
    for n in [5, 15, 1, 3] {
        mf.add_num(n);
    }
    println!("{}", mf.find_median());
}
