fn nth_ugly(n: usize) -> u64 {
    let mut u = vec![1u64];
    let (mut i2, mut i3, mut i5) = (0, 0, 0);
    while u.len() < n {
        let nx = (u[i2] * 2).min(u[i3] * 3).min(u[i5] * 5);
        u.push(nx);
        if nx == u[i2] * 2 { i2 += 1; }
        if nx == u[i3] * 3 { i3 += 1; }
        if nx == u[i5] * 5 { i5 += 1; }
    }
    u[n - 1]
}

fn main() {
    let v: Vec<u64> = (1..=15).map(nth_ugly).collect();
    println!("{:?}", v);
    assert_eq!(nth_ugly(10), 12);
}
