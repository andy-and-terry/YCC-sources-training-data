use std::sync::{Arc, RwLock};
use std::thread;

fn main() {
    let cfg = Arc::new(RwLock::new(String::from("v1")));
    let readers: Vec<_> = (0..3).map(|_| { let c = Arc::clone(&cfg); thread::spawn(move || c.read().unwrap().len()) }).collect();
    for r in readers { r.join().unwrap(); }
    *cfg.write().unwrap() = String::from("v2-new");
    println!("{}", cfg.read().unwrap());
}
