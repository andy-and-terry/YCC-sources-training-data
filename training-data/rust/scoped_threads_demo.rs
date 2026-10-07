use std::thread;

// Scoped threads can borrow local data directly (no `Arc`, no `'static`
// bound, no cloning) because the scope guarantees they finish before it ends.
fn parallel_sum(data: &[i64]) -> i64 {
    let mid = data.len() / 2;
    let (left, right) = data.split_at(mid);

    let mut left_sum = 0;
    let mut right_sum = 0;

    thread::scope(|s| {
        s.spawn(|| left_sum = left.iter().sum());
        s.spawn(|| right_sum = right.iter().sum());
    });

    left_sum + right_sum
}

fn main() {
    let data: Vec<i64> = (1..=1000).collect();
    println!("{}", parallel_sum(&data));
}
