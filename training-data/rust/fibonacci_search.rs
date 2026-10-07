fn fibonacci_search(a: &[i32], target: i32) -> Option<usize> {
    let n = a.len() as i64;
    let (mut f2, mut f1, mut f) = (0i64, 1i64, 1i64);
    while f < n {
        f2 = f1;
        f1 = f;
        f = f1 + f2;
    }
    let mut offset = -1i64;
    while f > 1 {
        let i = (offset + f2).min(n - 1) as usize;
        if a[i] < target {
            f = f1;
            f1 = f2;
            f2 = f - f1;
            offset = i as i64;
        } else if a[i] > target {
            f = f2;
            f1 -= f2;
            f2 = f - f1;
        } else {
            return Some(i);
        }
    }
    let last = (offset + 1) as usize;
    (f1 == 1 && last < a.len() && a[last] == target).then_some(last)
}

fn main() {
    let a = [10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100];
    for t in [85, 10, 100, 7] {
        println!("{} -> {:?}", t, fibonacci_search(&a, t));
    }
}
