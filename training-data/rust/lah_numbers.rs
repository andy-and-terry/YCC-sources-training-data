fn lah(n: u64, k: u64) -> u64 {
    // L(n,k) = C(n-1,k-1) * n!/k!
    let mut c = 1u64;
    for i in 0..(k - 1) {
        c = c * (n - 1 - i) / (i + 1);
    }
    let f: u64 = (k + 1..=n).product();
    c * f
}

fn main() {
    for n in 1..=5 {
        let row: Vec<u64> = (1..=n).map(|k| lah(n, k)).collect();
        println!("{:?}", row);
    }
}
