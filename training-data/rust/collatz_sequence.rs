struct Collatz(u64);

impl Iterator for Collatz {
    type Item = u64;
    fn next(&mut self) -> Option<u64> {
        let cur = self.0;
        if cur == 0 {
            return None;
        }
        self.0 = match cur {
            1 => 0,
            n if n % 2 == 0 => n / 2,
            n => 3 * n + 1,
        };
        Some(cur)
    }
}

fn main() {
    let seq: Vec<u64> = Collatz(27).collect();
    println!("{:?}... length {}", &seq[..10], seq.len());
    const LIMIT: usize = 1_000_000;
    let mut steps = vec![0u16; LIMIT];
    let mut best = 1;
    for i in 2..LIMIT {
        let (mut n, mut c) = (i as u64, 0u16);
        while n >= i as u64 {
            n = if n % 2 == 0 { n / 2 } else { 3 * n + 1 };
            c += 1;
        }
        steps[i] = c + steps[n as usize];
        if steps[i] > steps[best] {
            best = i;
        }
    }
    println!("longest under 1e6: {} ({} steps)", best, steps[best]);
}
