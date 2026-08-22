use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

struct BloomFilter {
    bits: Vec<bool>,
    size: usize,
    num_hashes: u32,
}

impl BloomFilter {
    fn new(size: usize, num_hashes: u32) -> Self {
        BloomFilter { bits: vec![false; size], size, num_hashes }
    }

    fn hashes(&self, item: &str) -> Vec<usize> {
        (0..self.num_hashes)
            .map(|i| {
                let mut hasher = DefaultHasher::new();
                (i, item).hash(&mut hasher);
                (hasher.finish() as usize) % self.size
            })
            .collect()
    }

    fn add(&mut self, item: &str) {
        for idx in self.hashes(item) {
            self.bits[idx] = true;
        }
    }

    fn might_contain(&self, item: &str) -> bool {
        self.hashes(item).iter().all(|&idx| self.bits[idx])
    }
}

fn main() {
    let mut bf = BloomFilter::new(1000, 3);
    bf.add("hello");
    println!("{} {}", bf.might_contain("hello"), bf.might_contain("world"));
}
