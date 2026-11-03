fn triangular() -> impl Iterator<Item = u64> {
    (1u64..).scan(0, |sum, n| {
        *sum += n;
        Some(*sum)
    })
}

fn main() {
    let first: Vec<u64> = triangular().take(10).collect();
    println!("{:?}", first);
}
