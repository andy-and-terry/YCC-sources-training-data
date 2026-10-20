struct Countdown(u32);

impl Iterator for Countdown {
    type Item = u32;
    fn next(&mut self) -> Option<u32> {
        if self.0 == 0 { None } else { self.0 -= 1; Some(self.0 + 1) }
    }
}

fn main() {
    println!("{:?}", Countdown(5).collect::<Vec<_>>());
    println!("{}", Countdown(4).sum::<u32>());
}
