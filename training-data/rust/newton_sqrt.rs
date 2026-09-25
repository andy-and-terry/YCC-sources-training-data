fn newton<F, D>(f: F, df: D, x0: f64, tol: f64, max_iter: usize) -> Result<(f64, usize), String>
where
    F: Fn(f64) -> f64,
    D: Fn(f64) -> f64,
{
    let mut x = x0;
    for i in 1..=max_iter {
        let d = df(x);
        if d == 0.0 {
            return Err(format!("zero derivative at x = {}", x));
        }
        let next = x - f(x) / d;
        if (next - x).abs() < tol {
            return Ok((next, i));
        }
        x = next;
    }
    Err(format!("no convergence in {} iterations", max_iter))
}

fn main() {
    for a in [2.0f64, 9.0, 0.25, 1e10] {
        let (r, it) = newton(|x| x * x - a, |x| 2.0 * x, a.max(1.0), 1e-12, 100).unwrap();
        println!("sqrt({}) = {:.12} in {} iterations (std: {:.12})", a, r, it, a.sqrt());
    }
    println!("{:?}", newton(|x| x * x + 1.0, |x| 2.0 * x, 0.0, 1e-12, 50));
    println!("{:?}", newton(|x| x.cos() - x, |x| -x.sin() - 1.0, 1.0, 1e-12, 50));
}
