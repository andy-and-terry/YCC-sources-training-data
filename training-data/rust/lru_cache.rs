use std::collections::HashMap;

struct LruCache {
    capacity: usize,
    order: Vec<i32>,
    map: HashMap<i32, i32>,
}

impl LruCache {
    fn new(capacity: usize) -> Self {
        LruCache { capacity, order: Vec::new(), map: HashMap::new() }
    }

    fn touch(&mut self, key: i32) {
        self.order.retain(|&k| k != key);
        self.order.push(key);
    }

    fn get(&mut self, key: i32) -> Option<i32> {
        if let Some(&value) = self.map.get(&key) {
            self.touch(key);
            Some(value)
        } else {
            None
        }
    }

    fn put(&mut self, key: i32, value: i32) {
        if self.map.len() >= self.capacity && !self.map.contains_key(&key) {
            let lru_key = self.order.remove(0);
            self.map.remove(&lru_key);
        }
        self.map.insert(key, value);
        self.touch(key);
    }
}

fn main() {
    let mut cache = LruCache::new(2);
    cache.put(1, 100);
    cache.put(2, 200);
    cache.get(1);
    cache.put(3, 300);
    println!("{:?} {:?} {:?}", cache.get(1), cache.get(2), cache.get(3));
}
