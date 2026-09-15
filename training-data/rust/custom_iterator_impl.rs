struct Fibonacci {
    current: u64,
    next: u64,
}

impl Fibonacci {
    fn new() -> Self {
        Fibonacci { current: 0, next: 1 }
    }
}

impl Iterator for Fibonacci {
    type Item = u64;

    fn next(&mut self) -> Option<u64> {
        let value = self.current;
        let new_next = self.current + self.next;
        self.current = self.next;
        self.next = new_next;
        Some(value)
    }
}

fn main() {
    let first_ten: Vec<u64> = Fibonacci::new().take(10).collect();
    println!("{:?}", first_ten);

    let sum_of_evens: u64 = Fibonacci::new().take(15).filter(|n| n % 2 == 0).sum();
    println!("{}", sum_of_evens);

    let first_over_100 = Fibonacci::new().find(|&n| n > 100);
    println!("{:?}", first_over_100);
}
