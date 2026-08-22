fn gradient_descent<F: Fn(f64) -> f64>(grad_fn: F, start: f64, learning_rate: f64, iterations: u32) -> f64 {
    let mut x = start;
    for _ in 0..iterations {
        x -= learning_rate * grad_fn(x);
    }
    x
}

fn main() {
    let minimum = gradient_descent(|x| 2.0 * (x - 3.0), 0.0, 0.1, 50);
    println!("{:.4}", minimum);
}
