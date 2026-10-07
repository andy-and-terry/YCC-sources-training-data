/// Sorts with the minimum possible number of writes; returns the write count.
fn cycle_sort<T: Ord + Copy>(a: &mut [T]) -> usize {
    let mut writes = 0;
    let position = |a: &[T], item: T, start: usize| start + a[start + 1..].iter().filter(|&&x| x < item).count();
    for start in 0..a.len().saturating_sub(1) {
        let mut item = a[start];
        let mut pos = position(a, item, start);
        if pos == start {
            continue;
        }
        while item == a[pos] {
            pos += 1;
        }
        std::mem::swap(&mut item, &mut a[pos]);
        writes += 1;
        while pos != start {
            pos = position(a, item, start);
            while item == a[pos] {
                pos += 1;
            }
            std::mem::swap(&mut item, &mut a[pos]);
            writes += 1;
        }
    }
    writes
}

fn main() {
    let mut v = vec![1, 8, 3, 9, 10, 10, 2, 4];
    let w = cycle_sort(&mut v);
    println!("{:?} writes: {}", v, w);
}
