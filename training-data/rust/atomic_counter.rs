use std::sync::atomic::{AtomicUsize, Ordering};
use std::sync::Arc;
use std::thread;

struct Metrics {
    requests: AtomicUsize,
}

impl Metrics {
    fn new() -> Self {
        Metrics { requests: AtomicUsize::new(0) }
    }

    fn record(&self) -> usize {
        self.requests.fetch_add(1, Ordering::SeqCst) + 1
    }

    fn total(&self) -> usize {
        self.requests.load(Ordering::SeqCst)
    }
}

fn main() {
    let metrics = Arc::new(Metrics::new());
    let mut handles = vec![];

    for _ in 0..8 {
        let metrics = Arc::clone(&metrics);
        handles.push(thread::spawn(move || {
            for _ in 0..500 {
                metrics.record();
            }
        }));
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("total requests: {}", metrics.total());
}
