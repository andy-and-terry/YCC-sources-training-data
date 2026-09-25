fn binary_insertion_sort<T: Ord>(a: &mut [T]) {
    for i in 1..a.len() {
        let pos = a[..i].partition_point(|x| x <= &a[i]);
        a[pos..=i].rotate_right(1);
    }
}

fn main() {
    let mut v = vec![37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54];
    binary_insertion_sort(&mut v);
    println!("{:?}", v);
}
