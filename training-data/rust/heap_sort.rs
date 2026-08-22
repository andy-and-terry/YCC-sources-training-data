fn sift_down(arr: &mut [i32], start: usize, end: usize) {
    let mut root = start;
    loop {
        let child = 2 * root + 1;
        if child > end {
            return;
        }
        let mut chosen = child;
        if child + 1 <= end && arr[child] < arr[child + 1] {
            chosen = child + 1;
        }
        if arr[root] < arr[chosen] {
            arr.swap(root, chosen);
            root = chosen;
        } else {
            return;
        }
    }
}

fn heap_sort(items: &[i32]) -> Vec<i32> {
    let mut arr = items.to_vec();
    let n = arr.len();
    if n == 0 {
        return arr;
    }
    for start in (0..n / 2).rev() {
        sift_down(&mut arr, start, n - 1);
    }
    for end in (1..n).rev() {
        arr.swap(0, end);
        sift_down(&mut arr, 0, end - 1);
    }
    arr
}

fn main() {
    println!("{:?}", heap_sort(&[5, 3, 8, 1, 9, 2]));
}
