use std::sync::mpsc;
use std::thread;

fn main() {
    let (tx, rx) = mpsc::channel();
    for id in 0..4 {
        let tx = tx.clone();
        thread::spawn(move || {
            tx.send((id, id * id)).unwrap();
        });
    }
    drop(tx);
    let mut results: Vec<_> = rx.iter().collect();
    results.sort();
    println!("{:?}", results);
}
