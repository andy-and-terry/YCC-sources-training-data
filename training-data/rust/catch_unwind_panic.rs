use std::panic::{self, AssertUnwindSafe};

fn risky(n: i32) -> i32 {
    if n < 0 {
        panic!("negative input: {n}");
    }
    n * 2
}

fn main() {
    panic::set_hook(Box::new(|_| {})); // silence default message
    let ok = panic::catch_unwind(|| risky(4));
    println!("{:?}", ok.is_ok());
    let bad = panic::catch_unwind(|| risky(-1));
    match bad {
        Ok(_) => println!("no panic"),
        Err(payload) => {
            let msg = payload.downcast_ref::<String>().cloned().unwrap_or_default();
            println!("caught: {msg}");
        }
    }
    let mut counter = 0;
    let _ = panic::catch_unwind(AssertUnwindSafe(|| {
        counter += 1;
        panic!("boom");
    }));
    println!("{counter}");
}
