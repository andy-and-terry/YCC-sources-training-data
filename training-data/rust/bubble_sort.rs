fn bubble_sort(items: &[i32]) -> Vec<i32> {
    let mut arr = items.to_vec();
    for i in 0..arr.len() {
        let mut swapped = false;
        for j in 0..arr.len() - i - 1 {
            if arr[j] > arr[j + 1] {
                arr.swap(j, j + 1);
                swapped = true;
            }
        }
        if !swapped {
            break;
        }
    }
    arr
}

fn main() {
    println!("{:?}", bubble_sort(&[5, 3, 8, 1, 9, 2]));
}
