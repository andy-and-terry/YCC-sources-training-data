use std::thread;
use std::time::Duration;

#[derive(Debug)]
enum OpError {
    Transient(&'static str),
    Fatal(&'static str),
}

fn retry<T>(mut op: impl FnMut() -> Result<T, OpError>, attempts: u32, base: Duration, cap: Duration) -> Result<T, OpError> {
    let mut seed: u64 = 0x2545F4914F6CDD1D;
    for attempt in 1.. {
        match op() {
            Ok(v) => return Ok(v),
            Err(OpError::Transient(msg)) if attempt < attempts => {
                let ceiling = cap.min(base * 2u32.pow(attempt)).as_millis() as u64;
                seed ^= seed << 13;
                seed ^= seed >> 7;
                seed ^= seed << 17;
                let delay = Duration::from_millis(seed % (ceiling + 1));
                println!("attempt {} failed ({}), sleeping {:?}", attempt, msg, delay);
                thread::sleep(delay);
            }
            Err(e) => return Err(e),
        }
    }
    unreachable!()
}

fn main() {
    let mut calls = 0;
    let r = retry(
        || {
            calls += 1;
            if calls < 4 { Err(OpError::Transient("timeout")) } else { Ok("ok") }
        },
        5,
        Duration::from_millis(10),
        Duration::from_millis(200),
    );
    println!("{:?} after {} calls", r, calls);
    let fatal: Result<(), _> = retry(|| Err(OpError::Fatal("bad credentials")), 5, Duration::from_millis(10), Duration::from_millis(200));
    if let Err(OpError::Fatal(msg)) = fatal {
        println!("gave up immediately: {}", msg);
    }
}
