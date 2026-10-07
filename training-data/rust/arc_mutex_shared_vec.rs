use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let log = Arc::new(Mutex::new(Vec::new()));
    let handles: Vec<_> = (0..4)
        .map(|i| {
            let log = Arc::clone(&log);
            thread::spawn(move || {
                let mut guard = log.lock().unwrap();
                guard.push(i * i);
            })
        })
        .collect();
    for h in handles {
        h.join().unwrap();
    }
    let mut data = log.lock().unwrap().clone();
    data.sort();
    println!("{:?} strong={}", data, Arc::strong_count(&log));
}
