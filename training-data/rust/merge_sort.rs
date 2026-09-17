fn merge_sort(items: &[i32]) -> Vec<i32> {
    if items.len() <= 1 {
        return items.to_vec();
    }
    let mid = items.len() / 2;
    let left = merge_sort(&items[..mid]);
    let right = merge_sort(&items[mid..]);
    merge(&left, &right)
}

fn merge(left: &[i32], right: &[i32]) -> Vec<i32> {
    let mut result = Vec::with_capacity(left.len() + right.len());
    let (mut i, mut j) = (0, 0);
    while i < left.len() && j < right.len() {
        if left[i] <= right[j] {
            result.push(left[i]);
            i += 1;
        } else {
            result.push(right[j]);
            j += 1;
        }
    }
    result.extend_from_slice(&left[i..]);
    result.extend_from_slice(&right[j..]);
    result
}

fn main() {
    let data = vec![5, 3, 8, 1, 9, 2, 7];
    println!("{:?}", merge_sort(&data));
}
