use std::cmp::Ordering;

/// Three-way partitions `a` around `pivot`; returns the range of elements equal to it.
fn partition3<T: Ord>(a: &mut [T], pivot: &T) -> std::ops::Range<usize> {
    let (mut lo, mut mid, mut hi) = (0, 0, a.len());
    while mid < hi {
        match a[mid].cmp(pivot) {
            Ordering::Less => {
                a.swap(lo, mid);
                lo += 1;
                mid += 1;
            }
            Ordering::Greater => {
                hi -= 1;
                a.swap(mid, hi);
            }
            Ordering::Equal => mid += 1,
        }
    }
    lo..hi
}

fn quicksort3<T: Ord + Clone>(a: &mut [T]) {
    if a.len() < 2 {
        return;
    }
    let pivot = a[a.len() / 2].clone();
    let eq = partition3(a, &pivot);
    let (left, rest) = a.split_at_mut(eq.start);
    quicksort3(left);
    quicksort3(&mut rest[eq.end - eq.start..]);
}

fn main() {
    let mut flags = vec![2, 0, 2, 1, 1, 0, 1, 2, 0];
    let r = partition3(&mut flags, &1);
    println!("{:?} ones at {:?}", flags, r);
    let mut v = vec![5, 3, 5, 1, 5, 2, 5, 9, 0, 5];
    quicksort3(&mut v);
    println!("{:?}", v);
}
