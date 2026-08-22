use std::time::{Duration, Instant};

#[derive(Debug, PartialEq)]
enum State {
    Closed,
    Open,
    HalfOpen,
}

struct CircuitBreaker {
    failure_threshold: u32,
    reset_timeout: Duration,
    failures: u32,
    state: State,
    opened_at: Option<Instant>,
}

impl CircuitBreaker {
    fn new(failure_threshold: u32, reset_timeout: Duration) -> Self {
        CircuitBreaker { failure_threshold, reset_timeout, failures: 0, state: State::Closed, opened_at: None }
    }

    fn call<F: FnOnce() -> Result<(), String>>(&mut self, f: F) -> Result<(), String> {
        if self.state == State::Open {
            if self.opened_at.unwrap().elapsed() >= self.reset_timeout {
                self.state = State::HalfOpen;
            } else {
                return Err("circuit is open".to_string());
            }
        }

        match f() {
            Ok(()) => {
                self.failures = 0;
                self.state = State::Closed;
                Ok(())
            }
            Err(e) => {
                self.failures += 1;
                if self.failures >= self.failure_threshold {
                    self.state = State::Open;
                    self.opened_at = Some(Instant::now());
                }
                Err(e)
            }
        }
    }
}

fn main() {
    let mut breaker = CircuitBreaker::new(2, Duration::from_millis(100));
    for _ in 0..2 {
        let _ = breaker.call(|| Err("fail".to_string()));
    }
    println!("{}", breaker.state == State::Open);
}
