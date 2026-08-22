fn power_set(items: &[i32]) -> Vec<Vec<i32>> {
    let mut result = vec![vec![]];
    for &item in items {
        let size = result.len();
        for i in 0..size {
            let mut subset = result[i].clone();
            subset.push(item);
            result.push(subset);
        }
    }
    result
}

fn main() {
    println!("{:?}", power_set(&[1, 2, 3]));
}
