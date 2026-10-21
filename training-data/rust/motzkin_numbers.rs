fn motzkin(n: usize) -> u64 {
    let mut m = vec![1u64, 1];
    for i in 2..=n {
        let next = ((2 * i as u64 + 1) * m[i - 1] + 3 * (i as u64 - 1) * m[i - 2]) / (i as u64 + 2);
        m.push(next);
    }
    m[n]
}

fn main() {
    let v: Vec<u64> = (0..10).map(motzkin).collect();
    println!("{:?}", v);
}
