use std::sync::{Arc, Barrier};
use std::thread;

fn main() {
    let barrier = Arc::new(Barrier::new(3));
    let handles: Vec<_> = (0..3)
        .map(|i| {
            let b = Arc::clone(&barrier);
            thread::spawn(move || {
                let res = b.wait();
                (i, res.is_leader())
            })
        })
        .collect();
    let leaders = handles
        .into_iter()
        .map(|h| h.join().unwrap())
        .filter(|(_, leader)| *leader)
        .count();
    println!("leaders: {}", leaders);
}
