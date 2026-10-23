struct Lucas {
    a: u64,
    b: u64,
}

impl Iterator for Lucas {
    type Item = u64;

    fn next(&mut self) -> Option<u64> {
        let out = self.a;
        self.a = self.b;
        self.b += out;
        Some(out)
    }
}

fn main() {
    let v: Vec<u64> = Lucas { a: 2, b: 1 }.take(10).collect();
    println!("{:?}", v);
}
