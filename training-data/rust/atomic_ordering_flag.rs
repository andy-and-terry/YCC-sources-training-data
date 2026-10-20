use std::sync::atomic::{AtomicBool, AtomicUsize, Ordering};
use std::sync::Arc;
use std::thread;

fn main() {
    let hits = Arc::new(AtomicUsize::new(0));
    let stop = Arc::new(AtomicBool::new(false));
    let handles: Vec<_> = (0..4)
        .map(|_| {
            let hits = Arc::clone(&hits);
            thread::spawn(move || {
                for _ in 0..1000 {
                    hits.fetch_add(1, Ordering::Relaxed);
                }
            })
        })
        .collect();
    for h in handles {
        h.join().unwrap();
    }
    stop.store(true, Ordering::Release);
    println!("{} {}", hits.load(Ordering::SeqCst), stop.load(Ordering::Acquire));
    let x = AtomicUsize::new(5);
    println!("{:?}", x.compare_exchange(5, 6, Ordering::AcqRel, Ordering::Relaxed));
    println!("{:?}", x.compare_exchange(5, 7, Ordering::AcqRel, Ordering::Relaxed));
    println!("{}", x.fetch_max(10, Ordering::SeqCst));
}
