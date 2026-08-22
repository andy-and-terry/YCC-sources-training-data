fn shell_sort(items: &[i32]) -> Vec<i32> {
    let mut arr = items.to_vec();
    let n = arr.len();
    let mut gap = n / 2;
    while gap > 0 {
        for i in gap..n {
            let temp = arr[i];
            let mut j = i;
            while j >= gap && arr[j - gap] > temp {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap /= 2;
    }
    arr
}

fn main() {
    println!("{:?}", shell_sort(&[5, 3, 8, 1, 9, 2]));
}
