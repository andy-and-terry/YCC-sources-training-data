use std::collections::HashMap;

struct LfuCache {
    capacity: usize,
    values: HashMap<i32, i32>,
    freq: HashMap<i32, u32>,
    tick: HashMap<i32, u64>,
    clock: u64,
}

impl LfuCache {
    fn new(capacity: usize) -> Self {
        LfuCache {
            capacity,
            values: HashMap::new(),
            freq: HashMap::new(),
            tick: HashMap::new(),
            clock: 0,
        }
    }

    fn touch(&mut self, key: i32) {
        self.clock += 1;
        *self.freq.entry(key).or_insert(0) += 1;
        self.tick.insert(key, self.clock);
    }

    fn get(&mut self, key: i32) -> Option<i32> {
        if let Some(&value) = self.values.get(&key) {
            self.touch(key);
            Some(value)
        } else {
            None
        }
    }

    fn put(&mut self, key: i32, value: i32) {
        if self.capacity == 0 {
            return;
        }
        if !self.values.contains_key(&key) && self.values.len() >= self.capacity {
            let evict = *self
                .values
                .keys()
                .min_by_key(|k| (self.freq[k], self.tick[k]))
                .unwrap();
            self.values.remove(&evict);
            self.freq.remove(&evict);
            self.tick.remove(&evict);
        }
        self.values.insert(key, value);
        self.touch(key);
    }
}

fn main() {
    let mut cache = LfuCache::new(2);
    cache.put(1, 10);
    cache.put(2, 20);
    cache.get(1); // key 1 now used more than key 2
    cache.put(3, 30); // evicts key 2 (least frequently used)
    println!("get(1) = {:?}", cache.get(1));
    println!("get(2) = {:?}", cache.get(2));
    println!("get(3) = {:?}", cache.get(3));
}
