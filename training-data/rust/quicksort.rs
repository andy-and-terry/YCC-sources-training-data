fn quicksort(items: &[i32]) -> Vec<i32> {
    if items.len() <= 1 {
        return items.to_vec();
    }
    let pivot = items[items.len() / 2];
    let left: Vec<i32> = items.iter().filter(|&&x| x < pivot).cloned().collect();
    let mid: Vec<i32> = items.iter().filter(|&&x| x == pivot).cloned().collect();
    let right: Vec<i32> = items.iter().filter(|&&x| x > pivot).cloned().collect();

    let mut result = quicksort(&left);
    result.extend(mid);
    result.extend(quicksort(&right));
    result
}

fn main() {
    let data = vec![5, 3, 8, 1, 9, 2];
    println!("{:?}", quicksort(&data));
}
