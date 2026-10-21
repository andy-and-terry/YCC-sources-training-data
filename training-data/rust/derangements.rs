fn derangements(n: u64) -> u64 {
    if n == 0 {
        return 1;
    }
    let (mut a, mut b) = (1u64, 0u64);
    for i in 2..=n {
        let next = (i - 1) * (a + b);
        a = b;
        b = next;
    }
    b
}

fn main() {
    let v: Vec<u64> = (0..8).map(derangements).collect();
    println!("{:?}", v);
}
