use std::time::Instant;

struct TokenBucket {
    capacity: f64,
    tokens: f64,
    refill_rate: f64,
    last_refill: Instant,
}

impl TokenBucket {
    fn new(capacity: f64, refill_rate: f64) -> Self {
        TokenBucket { capacity, tokens: capacity, refill_rate, last_refill: Instant::now() }
    }

    fn refill(&mut self) {
        let now = Instant::now();
        let elapsed = now.duration_since(self.last_refill).as_secs_f64();
        self.tokens = (self.tokens + elapsed * self.refill_rate).min(self.capacity);
        self.last_refill = now;
    }

    fn try_consume(&mut self, amount: f64) -> bool {
        self.refill();
        if self.tokens >= amount {
            self.tokens -= amount;
            true
        } else {
            false
        }
    }
}

fn main() {
    let mut bucket = TokenBucket::new(5.0, 1.0);
    let results: Vec<bool> = (0..7).map(|_| bucket.try_consume(1.0)).collect();
    println!("{:?}", results);
}
