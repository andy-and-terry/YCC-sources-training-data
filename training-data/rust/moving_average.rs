use std::collections::VecDeque;

struct Sma {
    window: VecDeque<f64>,
    size: usize,
    sum: f64,
}

impl Sma {
    fn new(size: usize) -> Self {
        Sma { window: VecDeque::with_capacity(size), size, sum: 0.0 }
    }

    fn push(&mut self, x: f64) -> f64 {
        self.window.push_back(x);
        self.sum += x;
        if self.window.len() > self.size {
            self.sum -= self.window.pop_front().unwrap();
        }
        self.sum / self.window.len() as f64
    }
}

fn ema(values: &[f64], alpha: f64) -> Vec<f64> {
    values
        .iter()
        .scan(None, |state: &mut Option<f64>, &x| {
            let next = state.map_or(x, |prev| alpha * x + (1.0 - alpha) * prev);
            *state = Some(next);
            Some(next)
        })
        .collect()
}

fn main() {
    let prices = [10.0, 11.0, 12.0, 13.0, 12.0, 11.0, 15.0, 18.0, 17.0, 16.0];
    let mut sma = Sma::new(3);
    for (p, e) in prices.iter().zip(ema(&prices, 0.5)) {
        println!("{:5.1}  sma={:7.3}  ema={:7.3}", p, sma.push(*p), e);
    }
}
