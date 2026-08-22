fn mean(values: &[f64]) -> f64 {
    values.iter().sum::<f64>() / values.len() as f64
}

fn median(values: &[f64]) -> f64 {
    let mut sorted = values.to_vec();
    sorted.sort_by(|a, b| a.partial_cmp(b).unwrap());
    let n = sorted.len();
    if n % 2 == 0 {
        (sorted[n / 2 - 1] + sorted[n / 2]) / 2.0
    } else {
        sorted[n / 2]
    }
}

fn variance(values: &[f64]) -> f64 {
    let m = mean(values);
    values.iter().map(|x| (x - m).powi(2)).sum::<f64>() / values.len() as f64
}

fn stdev(values: &[f64]) -> f64 {
    variance(values).sqrt()
}

fn main() {
    let data = [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0];
    println!("{} {} {}", mean(&data), median(&data), stdev(&data));
}
