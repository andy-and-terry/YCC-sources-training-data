fn comb_sort<T: PartialOrd>(a: &mut [T]) {
    let mut gap = a.len();
    let mut sorted = false;
    while !sorted {
        gap = (gap as f64 / 1.3) as usize;
        if gap <= 1 {
            gap = 1;
            sorted = true;
        }
        for i in 0..a.len().saturating_sub(gap) {
            if a[i] > a[i + gap] {
                a.swap(i, i + gap);
                sorted = false;
            }
        }
    }
}

fn main() {
    let mut v = vec![8, 4, 1, 56, 3, -44, 23, -6, 28, 0];
    comb_sort(&mut v);
    println!("{:?}", v);
}
