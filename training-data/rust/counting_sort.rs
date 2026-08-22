fn counting_sort(items: &[i32]) -> Vec<i32> {
    if items.is_empty() {
        return vec![];
    }
    let max = *items.iter().max().unwrap();
    let mut counts = vec![0; (max + 1) as usize];
    for &x in items {
        counts[x as usize] += 1;
    }
    let mut result = Vec::with_capacity(items.len());
    for (value, &count) in counts.iter().enumerate() {
        for _ in 0..count {
            result.push(value as i32);
        }
    }
    result
}

fn main() {
    println!("{:?}", counting_sort(&[5, 3, 8, 1, 9, 2, 3]));
}
