fn secant(f: impl Fn(f64) -> f64, mut a: f64, mut b: f64) -> f64 {
    for _ in 0..40 {
        let (fa, fb) = (f(a), f(b));
        if fa == fb { break; }
        let c = b - fb * (b - a) / (fb - fa);
        a = b;
        b = c;
    }
    b
}

fn main() {
    println!("{:.8}", secant(|x| x * x - 2.0, 1.0, 2.0));
}
