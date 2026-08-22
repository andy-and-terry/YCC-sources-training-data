fn bucket_sort(items: &[f64], bucket_count: usize) -> Vec<f64> {
    if items.is_empty() {
        return vec![];
    }
    let lo = items.iter().cloned().fold(f64::INFINITY, f64::min);
    let hi = items.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    let span = if hi - lo == 0.0 { 1.0 } else { hi - lo };
    let mut buckets: Vec<Vec<f64>> = vec![vec![]; bucket_count];
    for &x in items {
        let idx = (((x - lo) / span) * bucket_count as f64) as usize;
        let idx = idx.min(bucket_count - 1);
        buckets[idx].push(x);
    }
    let mut result = vec![];
    for mut bucket in buckets {
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
        result.extend(bucket);
    }
    result
}

fn main() {
    println!("{:?}", bucket_sort(&[0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51], 10));
}
