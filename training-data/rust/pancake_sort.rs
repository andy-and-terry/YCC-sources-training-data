fn pancake_sort(a: &mut [i32]) -> Vec<usize> {
    let mut flips = Vec::new();
    for size in (2..=a.len()).rev() {
        let max_idx = (0..size).max_by_key(|&i| a[i]).unwrap();
        if max_idx == size - 1 {
            continue;
        }
        if max_idx > 0 {
            a[..=max_idx].reverse();
            flips.push(max_idx + 1);
        }
        a[..size].reverse();
        flips.push(size);
    }
    flips
}

fn main() {
    let mut v = vec![23, 10, 20, 11, 12, 6, 7];
    let flips = pancake_sort(&mut v);
    println!("{:?} flips: {:?}", v, flips);
}
