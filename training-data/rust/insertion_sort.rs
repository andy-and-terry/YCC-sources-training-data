fn insertion_sort(items: &[i32]) -> Vec<i32> {
    let mut arr = items.to_vec();
    for i in 1..arr.len() {
        let key = arr[i];
        let mut j = i as isize - 1;
        while j >= 0 && arr[j as usize] > key {
            arr[(j + 1) as usize] = arr[j as usize];
            j -= 1;
        }
        arr[(j + 1) as usize] = key;
    }
    arr
}

fn main() {
    println!("{:?}", insertion_sort(&[5, 3, 8, 1, 9, 2]));
}
