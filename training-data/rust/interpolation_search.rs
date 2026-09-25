fn interpolation_search(a: &[i64], target: i64) -> Option<usize> {
    if a.is_empty() {
        return None;
    }
    let (mut lo, mut hi) = (0usize, a.len() - 1);
    while lo <= hi && target >= a[lo] && target <= a[hi] {
        if a[hi] == a[lo] {
            return (a[lo] == target).then_some(lo);
        }
        let pos = lo + ((target - a[lo]) as usize * (hi - lo)) / (a[hi] - a[lo]) as usize;
        match a[pos].cmp(&target) {
            std::cmp::Ordering::Equal => return Some(pos),
            std::cmp::Ordering::Less => lo = pos + 1,
            std::cmp::Ordering::Greater => {
                if pos == 0 {
                    return None;
                }
                hi = pos - 1
            }
        }
    }
    None
}

fn main() {
    let a = [10, 12, 13, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47];
    println!("{:?} {:?}", interpolation_search(&a, 18), interpolation_search(&a, 25));
}
