use std::sync::mpsc;
use std::thread;

fn main() {
    let (tx, rx) = mpsc::channel();
    let h = thread::spawn(move || { for i in 1..=5 { tx.send(i * i).unwrap(); } });
    h.join().unwrap();
    let total: i32 = rx.iter().sum();
    println!("{total}");
}
