use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let total = Arc::new(Mutex::new(0));
    let hs: Vec<_> = (1..=4).map(|i| {
        let t = Arc::clone(&total);
        thread::spawn(move || { *t.lock().unwrap() += i; })
    }).collect();
    for h in hs { h.join().unwrap(); }
    println!("{}", *total.lock().unwrap());
}
