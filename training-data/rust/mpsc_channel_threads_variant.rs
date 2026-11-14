use std::sync::mpsc;
use std::thread;

fn main() {
    let (tx, rx) = mpsc::channel();
    let hs: Vec<_> = (0..3)
        .map(|i| {
            let tx = tx.clone();
            thread::spawn(move || tx.send(i * 10).unwrap())
        })
        .collect();
    drop(tx);
    for h in hs { h.join().unwrap(); }
    let mut got: Vec<i32> = rx.iter().collect();
    got.sort();
    println!("{:?}", got);
}
