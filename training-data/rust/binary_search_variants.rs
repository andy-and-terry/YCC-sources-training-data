fn binary_search(items: &[i32], target: i32) -> Option<usize> {
    let mut low = 0i32;
    let mut high = items.len() as i32 - 1;
    while low <= high {
        let mid = (low + high) / 2;
        if items[mid as usize] == target {
            return Some(mid as usize);
        } else if items[mid as usize] < target {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    None
}

fn lower_bound(items: &[i32], target: i32) -> usize {
    let mut low = 0;
    let mut high = items.len();
    while low < high {
        let mid = (low + high) / 2;
        if items[mid] < target {
            low = mid + 1;
        } else {
            high = mid;
        }
    }
    low
}

fn main() {
    let data = [1, 2, 2, 2, 3, 5, 8];
    println!("{:?}", binary_search(&data, 5));
    println!("{}", lower_bound(&data, 2));
}
