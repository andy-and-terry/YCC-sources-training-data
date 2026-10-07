use std::sync::mpsc;
use std::thread;

fn main() {
    // Bounded channel: send blocks once 2 items are buffered.
    let (tx, rx) = mpsc::sync_channel::<u32>(2);
    let producer = thread::spawn(move || {
        for i in 0..5 {
            tx.send(i).unwrap();
        }
    });
    let received: Vec<u32> = rx.iter().collect();
    producer.join().unwrap();
    println!("{:?}", received);

    let (tx, rx) = mpsc::channel();
    for id in 0..3 {
        let tx = tx.clone();
        thread::spawn(move || tx.send(id * 10).unwrap());
    }
    drop(tx);
    let mut all: Vec<i32> = rx.iter().collect();
    all.sort();
    println!("{:?}", all);
}
