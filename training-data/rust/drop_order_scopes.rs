struct Noisy(&'static str);

impl Drop for Noisy {
    fn drop(&mut self) {
        println!("drop {}", self.0);
    }
}

fn make() -> Noisy {
    let _tmp = Noisy("temp in make");
    Noisy("returned")
}

fn main() {
    let _a = Noisy("a");
    let _b = Noisy("b");
    {
        let _inner = Noisy("inner");
        println!("leaving block");
    }
    let r = make();
    println!("got {}", r.0);
    let moved = Noisy("moved");
    std::mem::drop(moved);
    let _ = Noisy("ignored immediately");
    println!("end of main");
}
