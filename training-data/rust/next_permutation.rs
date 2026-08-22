fn next_permutation(nums: &[i32]) -> Vec<i32> {
    let mut arr = nums.to_vec();
    let n = arr.len();
    if n < 2 {
        return arr;
    }
    let mut i = n as isize - 2;
    while i >= 0 && arr[i as usize] >= arr[i as usize + 1] {
        i -= 1;
    }
    if i >= 0 {
        let mut j = n - 1;
        while arr[j] <= arr[i as usize] {
            j -= 1;
        }
        arr.swap(i as usize, j);
    }
    arr[(i + 1) as usize..].reverse();
    arr
}

fn main() {
    println!("{:?}", next_permutation(&[1, 2, 3]));
    println!("{:?}", next_permutation(&[3, 2, 1]));
}
