fn ternary_search(a: &[i32], target: i32) -> Option<usize> {
    let (mut lo, mut hi) = (0i64, a.len() as i64 - 1);
    while lo <= hi {
        let m1 = lo + (hi - lo) / 3;
        let m2 = hi - (hi - lo) / 3;
        let (v1, v2) = (a[m1 as usize], a[m2 as usize]);
        if v1 == target {
            return Some(m1 as usize);
        }
        if v2 == target {
            return Some(m2 as usize);
        }
        if target < v1 {
            hi = m1 - 1;
        } else if target > v2 {
            lo = m2 + 1;
        } else {
            lo = m1 + 1;
            hi = m2 - 1;
        }
    }
    None
}

fn argmax(f: impl Fn(f64) -> f64, mut lo: f64, mut hi: f64) -> f64 {
    for _ in 0..200 {
        let m1 = lo + (hi - lo) / 3.0;
        let m2 = hi - (hi - lo) / 3.0;
        if f(m1) < f(m2) {
            lo = m1;
        } else {
            hi = m2;
        }
    }
    (lo + hi) / 2.0
}

fn main() {
    println!("{:?} {:?}", ternary_search(&[1, 3, 5, 7, 9, 11, 13], 9), ternary_search(&[1, 3], 2));
    println!("{:.6} {:.6}", argmax(|x| -(x - 2.0) * (x - 2.0) + 3.0, -10.0, 10.0), argmax(f64::sin, 0.0, 3.0));
}
