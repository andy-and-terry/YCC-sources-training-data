use std::sync::{Arc, Mutex};
use std::thread;

// Shared mutable state across threads: Arc for sharing, Mutex for exclusion.
fn main() {
    let total = Arc::new(Mutex::new(0u32));
    let handles: Vec<_> = (1..=4)
        .map(|i| {
            let total = Arc::clone(&total);
            thread::spawn(move || {
                let mut guard = total.lock().unwrap();
                *guard += i * 10;
            })
        })
        .collect();
    for h in handles {
        h.join().unwrap();
    }
    println!("{}", *total.lock().unwrap());
}
