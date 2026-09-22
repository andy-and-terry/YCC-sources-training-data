use std::collections::HashMap;
use std::sync::{Arc, RwLock};
use std::thread;

struct ConcurrentCache {
    entries: RwLock<HashMap<String, i32>>,
}

impl ConcurrentCache {
    fn new() -> Self {
        ConcurrentCache { entries: RwLock::new(HashMap::new()) }
    }

    fn get(&self, key: &str) -> Option<i32> {
        let entries = self.entries.read().unwrap();
        entries.get(key).copied()
    }

    fn insert(&self, key: String, value: i32) {
        let mut entries = self.entries.write().unwrap();
        entries.insert(key, value);
    }
}

fn main() {
    let cache = Arc::new(ConcurrentCache::new());
    let mut handles = vec![];

    for i in 0..5 {
        let cache = Arc::clone(&cache);
        handles.push(thread::spawn(move || {
            cache.insert(format!("key-{}", i), i * 10);
        }));
    }

    for handle in handles {
        handle.join().unwrap();
    }

    for i in 0..5 {
        println!("{:?}", cache.get(&format!("key-{}", i)));
    }
}
