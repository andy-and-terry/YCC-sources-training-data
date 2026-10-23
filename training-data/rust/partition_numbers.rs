fn partitions(n: usize) -> u64 {
    let mut ways = vec![0u64; n + 1];
    ways[0] = 1;
    for part in 1..=n {
        for t in part..=n {
            ways[t] += ways[t - part];
        }
    }
    ways[n]
}

fn main() {
    let v: Vec<u64> = (0..10).map(partitions).collect();
    println!("{:?}", v);
}
