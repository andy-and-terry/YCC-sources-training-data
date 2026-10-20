struct Fib {
    a: u64,
    b: u64,
}

impl Iterator for Fib {
    type Item = u64;

    fn next(&mut self) -> Option<u64> {
        let out = self.a;
        self.a = self.b;
        self.b += out;
        Some(out)
    }
}

fn main() {
    let v: Vec<u64> = Fib { a: 0, b: 1 }.skip(5).step_by(2).take(5).collect();
    println!("{:?}", v);
}
