use std::sync::{Arc, Condvar, Mutex, RwLock};
use std::thread;

fn main() {
    let config = Arc::new(RwLock::new(String::from("v1")));
    let readers: Vec<_> = (0..3)
        .map(|_| {
            let c = Arc::clone(&config);
            thread::spawn(move || c.read().unwrap().len())
        })
        .collect();
    for r in readers {
        assert_eq!(r.join().unwrap(), 2);
    }
    config.write().unwrap().push_str("-patched");
    println!("{}", config.read().unwrap());

    let pair = Arc::new((Mutex::new(false), Condvar::new()));
    let p2 = Arc::clone(&pair);
    let waiter = thread::spawn(move || {
        let (lock, cv) = &*p2;
        let mut ready = lock.lock().unwrap();
        while !*ready {
            ready = cv.wait(ready).unwrap();
        }
        "woken"
    });
    {
        let (lock, cv) = &*pair;
        *lock.lock().unwrap() = true;
        cv.notify_all();
    }
    println!("{}", waiter.join().unwrap());
}
