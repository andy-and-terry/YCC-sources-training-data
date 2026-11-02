use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let c = Arc::new(Mutex::new(0));
    let hs: Vec<_> = (0..4).map(|_| {
        let c = Arc::clone(&c);
        thread::spawn(move || { for _ in 0..100 { *c.lock().unwrap() += 1; } })
    }).collect();
    for h in hs { h.join().unwrap(); }
    println!("{}", *c.lock().unwrap());
}
