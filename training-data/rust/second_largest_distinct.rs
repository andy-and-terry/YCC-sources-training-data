use std::collections::BTreeSet;

fn second_largest(values: &[i32]) -> Option<i32> {
    let distinct: BTreeSet<i32> = values.iter().copied().collect();
    distinct.iter().rev().nth(1).copied()
}

fn main() {
    println!("{:?}", second_largest(&[5, 3, 9, 9, 1]));
    println!("{:?}", second_largest(&[2, 2]));
}
