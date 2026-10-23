fn main() {
    let mut v = vec![3.5, -1.0, f64::NAN, 2.25, 0.0, -0.0, f64::INFINITY];
    v.sort_by(|a, b| a.total_cmp(b));
    println!("{:?}", v);

    let mut w = vec![2.5, 1.5, 9.0, -4.0];
    w.sort_by(|a, b| b.partial_cmp(a).unwrap());
    println!("{:?}", w);

    let max = w.iter().copied().fold(f64::NEG_INFINITY, f64::max);
    let min = w.iter().copied().min_by(|a, b| a.total_cmp(b));
    println!("{} {:?}", max, min);

    println!("{:?}", 1.0_f64.partial_cmp(&f64::NAN));
    println!("{}", f64::NAN == f64::NAN);
}
