use std::sync::atomic::{AtomicUsize, Ordering};
use std::sync::Arc;
use std::thread;

struct AtomicCounter {
    value: AtomicUsize,
}

impl AtomicCounter {
    fn new() -> Self {
        AtomicCounter { value: AtomicUsize::new(0) }
    }

    fn increment(&self) {
        self.value.fetch_add(1, Ordering::SeqCst);
    }

    fn get(&self) -> usize {
        self.value.load(Ordering::SeqCst)
    }
}

fn main() {
    let counter = Arc::new(AtomicCounter::new());
    let mut handles = vec![];

    for _ in 0..10 {
        let counter = Arc::clone(&counter);
        handles.push(thread::spawn(move || {
            for _ in 0..1000 {
                counter.increment();
            }
        }));
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Final count: {}", counter.get());
}
