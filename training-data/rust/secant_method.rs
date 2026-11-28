fn secant(f: impl Fn(f64) -> f64, mut x0: f64, mut x1: f64) -> f64 {
    for _ in 0..50 {
        let (f0, f1) = (f(x0), f(x1));
        if f1 == f0 {
            break;
        }
        let next = x1 - f1 * (x1 - x0) / (f1 - f0);
        x0 = x1;
        x1 = next;
        if (x1 - x0).abs() < 1e-12 {
            break;
        }
    }
    x1
}

fn main() {
    println!("{}", secant(|x| x * x - 2.0, 1.0, 2.0));
}
