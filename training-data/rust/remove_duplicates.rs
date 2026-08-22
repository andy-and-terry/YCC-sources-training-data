use std::collections::HashSet;

fn remove_duplicates_ordered(items: &[i32]) -> Vec<i32> {
    let mut seen = HashSet::new();
    items.iter().filter(|&&x| seen.insert(x)).cloned().collect()
}

fn main() {
    println!("{:?}", remove_duplicates_ordered(&[1, 2, 2, 3, 1, 4]));
}
