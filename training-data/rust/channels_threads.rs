use std::sync::mpsc;
use std::thread;

fn main() {
    let (tx, rx) = mpsc::channel();

    let mut handles = vec![];
    for i in 0..5 {
        let tx = tx.clone();
        handles.push(thread::spawn(move || {
            tx.send(i * i).unwrap();
        }));
    }
    drop(tx);

    for handle in handles {
        handle.join().unwrap();
    }

    let mut results: Vec<i32> = rx.iter().collect();
    results.sort();
    println!("{:?}", results);
}
