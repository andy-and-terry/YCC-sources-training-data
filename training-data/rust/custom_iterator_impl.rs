struct Collatz {
    current: u64,
    done: bool,
}

impl Collatz {
    fn new(start: u64) -> Self {
        Collatz { current: start, done: false }
    }
}

impl Iterator for Collatz {
    type Item = u64;

    fn next(&mut self) -> Option<u64> {
        if self.done {
            return None;
        }
        let value = self.current;
        if value == 1 {
            self.done = true;
        } else if value % 2 == 0 {
            self.current = value / 2;
        } else {
            self.current = 3 * value + 1;
        }
        Some(value)
    }
}

fn main() {
    let sequence: Vec<u64> = Collatz::new(27).collect();
    println!("{}", sequence.len());
    println!("{:?}", &sequence[..10]);

    let even_count = Collatz::new(6).filter(|n| n % 2 == 0).count();
    println!("{}", even_count);
}
