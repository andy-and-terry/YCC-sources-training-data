use std::collections::VecDeque;

struct MovingAverage {
    window: VecDeque<f64>,
    cap: usize,
    sum: f64,
}

impl MovingAverage {
    fn new(cap: usize) -> Self {
        Self { window: VecDeque::with_capacity(cap), cap, sum: 0.0 }
    }

    fn next(&mut self, v: f64) -> f64 {
        if self.window.len() == self.cap {
            self.sum -= self.window.pop_front().unwrap();
        }
        self.window.push_back(v);
        self.sum += v;
        self.sum / self.window.len() as f64
    }
}

fn main() {
    let mut ma = MovingAverage::new(3);
    let out: Vec<String> = [1.0, 10.0, 3.0, 5.0, 8.0, 2.0].iter().map(|&v| format!("{:.2}", ma.next(v))).collect();
    println!("{}", out.join(" "));
}
