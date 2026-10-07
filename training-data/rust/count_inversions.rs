fn count_inversions(v: &mut Vec<i32>) -> u64 {
    let n = v.len();
    if n <= 1 {
        return 0;
    }
    let mut right = v.split_off(n / 2);
    let mut total = count_inversions(v) + count_inversions(&mut right);
    let left = std::mem::take(v);
    let (mut i, mut j) = (0, 0);
    while i < left.len() && j < right.len() {
        if left[i] <= right[j] {
            v.push(left[i]);
            i += 1;
        } else {
            v.push(right[j]);
            total += (left.len() - i) as u64;
            j += 1;
        }
    }
    v.extend_from_slice(&left[i..]);
    v.extend_from_slice(&right[j..]);
    total
}

fn main() {
    println!("{}", count_inversions(&mut vec![2, 4, 1, 3, 5]));
    println!("{}", count_inversions(&mut vec![5, 4, 3, 2, 1]));
}
