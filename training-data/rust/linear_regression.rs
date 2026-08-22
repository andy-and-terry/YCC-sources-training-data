fn fit(xs: &[f64], ys: &[f64]) -> (f64, f64) {
    let n = xs.len() as f64;
    let mean_x = xs.iter().sum::<f64>() / n;
    let mean_y = ys.iter().sum::<f64>() / n;

    let mut numerator = 0.0;
    let mut denominator = 0.0;
    for i in 0..xs.len() {
        numerator += (xs[i] - mean_x) * (ys[i] - mean_y);
        denominator += (xs[i] - mean_x).powi(2);
    }
    let slope = numerator / denominator;
    let intercept = mean_y - slope * mean_x;
    (slope, intercept)
}

fn predict(slope: f64, intercept: f64, x: f64) -> f64 {
    slope * x + intercept
}

fn main() {
    let xs = [1.0, 2.0, 3.0, 4.0, 5.0];
    let ys = [2.0, 4.0, 5.0, 4.0, 5.0];
    let (slope, intercept) = fit(&xs, &ys);
    println!("y = {:.2}x + {:.2}", slope, intercept);
    println!("{}", predict(slope, intercept, 6.0));
}
