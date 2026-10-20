struct Noisy(&'static str);

impl Drop for Noisy {
    fn drop(&mut self) {
        println!("drop {}", self.0);
    }
}

struct Pair {
    _first: Noisy,
    _second: Noisy,
}

fn main() {
    let _a = Noisy("a");
    let _b = Noisy("b");
    {
        let _inner = Noisy("inner");
        println!("inner scope ending");
    }
    let _ = Noisy("ignored-immediately");
    let _kept = Noisy("kept");
    let moved = Noisy("moved");
    std::mem::drop(moved);
    let _pair = Pair { _first: Noisy("field1"), _second: Noisy("field2") };
    let forgotten = Noisy("forgotten");
    std::mem::forget(forgotten);
    println!("end of main");
}
