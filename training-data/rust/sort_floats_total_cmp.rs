fn main() {
    let mut xs: Vec<f64> = vec![3.2, -1.5, 0.0, 9.9, 2.5, -7.25];
    xs.sort_by(|a, b| a.partial_cmp(b).unwrap());
    println!("{:?}", xs);

    xs.sort_by(|a, b| b.total_cmp(a));
    println!("descending: {:?}", xs);

    let max = xs.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    println!("max = {}", max);

    let mut words = vec!["pear", "fig", "banana", "kiwi"];
    words.sort_unstable_by_key(|w| (w.len(), *w));
    println!("{:?}", words);
}
