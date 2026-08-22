struct Perceptron {
    weights: Vec<f64>,
    bias: f64,
    learning_rate: f64,
}

impl Perceptron {
    fn new(input_size: usize, learning_rate: f64, seed: &mut u64) -> Self {
        let mut next_rand = || {
            *seed = seed.wrapping_mul(6364136223846793005).wrapping_add(1);
            ((*seed >> 33) as f64 / u32::MAX as f64) * 2.0 - 1.0
        };
        let weights = (0..input_size).map(|_| next_rand()).collect();
        let bias = next_rand();
        Perceptron { weights, bias, learning_rate }
    }

    fn activate(x: f64) -> i32 {
        if x >= 0.0 {
            1
        } else {
            0
        }
    }

    fn predict(&self, inputs: &[f64]) -> i32 {
        let total: f64 = self.bias + inputs.iter().zip(&self.weights).map(|(x, w)| x * w).sum::<f64>();
        Self::activate(total)
    }

    fn train(&mut self, inputs: &[f64], target: i32) {
        let prediction = self.predict(inputs);
        let error = (target - prediction) as f64;
        for (w, x) in self.weights.iter_mut().zip(inputs) {
            *w += self.learning_rate * error * x;
        }
        self.bias += self.learning_rate * error;
    }
}

fn main() {
    let mut seed = 42u64;
    let data: [(Vec<f64>, i32); 4] = [
        (vec![0.0, 0.0], 0),
        (vec![0.0, 1.0], 0),
        (vec![1.0, 0.0], 0),
        (vec![1.0, 1.0], 1),
    ];
    let mut p = Perceptron::new(2, 0.1, &mut seed);
    for _ in 0..100 {
        for (inputs, target) in &data {
            p.train(inputs, *target);
        }
    }
    for (inputs, target) in &data {
        println!("{:?} {} {}", inputs, p.predict(inputs), target);
    }
}
