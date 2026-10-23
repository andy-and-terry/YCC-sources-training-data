struct Fib {
    a: u64,
    b: u64,
}

impl Iterator for Fib {
    type Item = u64;

    fn next(&mut self) -> Option<u64> {
        let r = self.a;
        self.a = self.b;
        self.b += r;
        Some(r)
    }
}

fn main() {
    let v: Vec<u64> = Fib { a: 0, b: 1 }.take(10).collect();
    println!("{:?}", v);
    let s: u64 = Fib { a: 0, b: 1 }.take_while(|&x| x < 100).filter(|x| x % 2 == 0).sum();
    println!("{}", s);
}
