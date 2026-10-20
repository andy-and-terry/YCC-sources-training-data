use std::sync::mpsc;
use std::thread;

fn main() {
    let (tx, rx) = mpsc::channel();
    let mut handles = Vec::new();
    for id in 0..3 {
        let tx = tx.clone();
        handles.push(thread::spawn(move || {
            tx.send((id, id * id)).unwrap();
        }));
    }
    drop(tx);
    for h in handles {
        h.join().unwrap();
    }
    let mut results: Vec<(i32, i32)> = rx.iter().collect();
    results.sort();
    println!("{:?}", results);
}
