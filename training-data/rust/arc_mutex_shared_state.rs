use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let total = Arc::new(Mutex::new(0i64));
    let mut handles = Vec::new();

    for _ in 0..10 {
        let total = Arc::clone(&total);
        handles.push(thread::spawn(move || {
            for _ in 0..1000 {
                let mut guard = total.lock().unwrap();
                *guard += 1;
            }
        }));
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("total: {}", *total.lock().unwrap());
    assert_eq!(*total.lock().unwrap(), 10_000);
}
