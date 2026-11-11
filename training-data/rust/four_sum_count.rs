use std::collections::HashMap;

fn four_sum_count(a: &[i32], b: &[i32], c: &[i32], d: &[i32]) -> usize {
    let mut sums: HashMap<i32, usize> = HashMap::new();
    for x in a {
        for y in b {
            *sums.entry(x + y).or_insert(0) += 1;
        }
    }
    let mut count = 0;
    for x in c {
        for y in d {
            count += sums.get(&-(x + y)).copied().unwrap_or(0);
        }
    }
    count
}

fn main() {
    println!("{}", four_sum_count(&[1, 2], &[-2, -1], &[-1, 2], &[0, 2])); // 2
}
