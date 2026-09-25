fn exponential_search<T: Ord>(a: &[T], target: &T) -> Option<usize> {
    if a.is_empty() {
        return None;
    }
    let mut bound = 1;
    while bound < a.len() && a[bound] < *target {
        bound *= 2;
    }
    let lo = bound / 2;
    let hi = (bound + 1).min(a.len());
    a[lo..hi].binary_search(target).ok().map(|i| i + lo)
}

fn main() {
    let v: Vec<i32> = (0..67).map(|i| i * 3).collect();
    println!("{:?} {:?} {:?}", exponential_search(&v, &99), exponential_search(&v, &100), exponential_search(&v, &0));
}
