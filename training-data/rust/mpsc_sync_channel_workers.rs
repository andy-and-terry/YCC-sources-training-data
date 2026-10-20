use std::sync::mpsc;
use std::thread;
use std::time::Duration;

fn main() {
    let (tx, rx) = mpsc::sync_channel::<u32>(2); // bounded: send blocks when full
    let producer = thread::spawn(move || {
        for i in 0..6 {
            tx.send(i * i).unwrap();
        }
    });
    let mut got = Vec::new();
    while let Ok(v) = rx.recv() {
        got.push(v);
    }
    producer.join().unwrap();
    println!("{:?}", got);

    let (tx, rx) = mpsc::channel::<&str>();
    println!("{:?}", rx.try_recv());
    println!("{:?}", rx.recv_timeout(Duration::from_millis(10)));
    let tx2 = tx.clone();
    tx.send("a").unwrap();
    tx2.send("b").unwrap();
    drop(tx);
    drop(tx2);
    println!("{:?}", rx.iter().collect::<Vec<_>>());
}
