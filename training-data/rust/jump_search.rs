fn jump_search<T: Ord>(a: &[T], target: &T) -> Option<usize> {
    let n = a.len();
    let step = ((n as f64).sqrt() as usize).max(1);
    let mut prev = 0;
    while prev < n && a[(prev + step).min(n) - 1] < *target {
        prev += step;
    }
    (prev..(prev + step).min(n)).find(|&i| a[i] == *target)
}

fn main() {
    let fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610];
    println!("{:?} {:?}", jump_search(&fib, &55), jump_search(&fib, &4));
}
