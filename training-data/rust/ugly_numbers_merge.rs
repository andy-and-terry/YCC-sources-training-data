fn ugly(n: usize) -> u64 {
    let mut seq = vec![1u64];
    let (mut i2, mut i3, mut i5) = (0, 0, 0);
    while seq.len() < n {
        let next = (seq[i2] * 2).min(seq[i3] * 3).min(seq[i5] * 5);
        seq.push(next);
        if next == seq[i2] * 2 { i2 += 1; }
        if next == seq[i3] * 3 { i3 += 1; }
        if next == seq[i5] * 5 { i5 += 1; }
    }
    seq[n - 1]
}

fn main() {
    let v: Vec<u64> = (1..=12).map(ugly).collect();
    println!("{:?}", v);
}
