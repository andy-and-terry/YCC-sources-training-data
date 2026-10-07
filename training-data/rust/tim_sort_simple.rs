const MIN_RUN: usize = 32;

fn insertion_sort<T: Ord + Clone>(a: &mut [T]) {
    for i in 1..a.len() {
        let pos = a[..i].partition_point(|x| x <= &a[i]);
        a[pos..=i].rotate_right(1);
    }
}

fn merge<T: Ord + Clone>(a: &mut [T], mid: usize) {
    let left = a[..mid].to_vec();
    let (mut i, mut j, mut k) = (0, mid, 0);
    while i < left.len() && j < a.len() {
        if left[i] <= a[j] {
            a[k] = left[i].clone();
            i += 1;
        } else {
            a[k] = a[j].clone();
            j += 1;
        }
        k += 1;
    }
    while i < left.len() {
        a[k] = left[i].clone();
        i += 1;
        k += 1;
    }
}

fn tim_sort<T: Ord + Clone>(a: &mut [T]) {
    let n = a.len();
    for chunk in a.chunks_mut(MIN_RUN) {
        insertion_sort(chunk);
    }
    let mut size = MIN_RUN;
    while size < n {
        let mut lo = 0;
        while lo + size < n {
            let hi = (lo + 2 * size).min(n);
            merge(&mut a[lo..hi], size);
            lo += 2 * size;
        }
        size *= 2;
    }
}

fn main() {
    // simple LCG so the example needs no external crates
    let mut seed: u64 = 42;
    let mut v: Vec<u32> = (0..2000)
        .map(|_| {
            seed = seed.wrapping_mul(6364136223846793005).wrapping_add(1442695040888963407);
            (seed >> 33) as u32 % 10000
        })
        .collect();
    let mut expected = v.clone();
    expected.sort();
    tim_sort(&mut v);
    println!("matches sort(): {}", v == expected);
}
