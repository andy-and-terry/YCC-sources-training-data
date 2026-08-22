fn selection_sort(items: &[i32]) -> Vec<i32> {
    let mut arr = items.to_vec();
    for i in 0..arr.len() {
        let mut min_idx = i;
        for j in i + 1..arr.len() {
            if arr[j] < arr[min_idx] {
                min_idx = j;
            }
        }
        arr.swap(i, min_idx);
    }
    arr
}

fn main() {
    println!("{:?}", selection_sort(&[5, 3, 8, 1, 9, 2]));
}
