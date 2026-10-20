use std::collections::HashMap;
use std::sync::{LazyLock, Mutex};

static TABLE: LazyLock<HashMap<&'static str, u32>> = LazyLock::new(|| {
    println!("initialising table");
    HashMap::from([("one", 1), ("two", 2), ("three", 3)])
});

static COUNTER: Mutex<u32> = Mutex::new(0);

fn main() {
    println!("start");
    println!("{:?}", TABLE.get("two"));
    println!("{:?}", TABLE.get("three"));
    *COUNTER.lock().unwrap() += 5;
    println!("{}", COUNTER.lock().unwrap());
}
