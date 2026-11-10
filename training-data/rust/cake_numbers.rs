fn cake(n: u64) -> u64 {
    (n * n * n + 5 * n + 6) / 6
}

fn main() {
    let v: Vec<u64> = (0..10).map(cake).collect();
    println!("{:?}", v); // [1, 2, 4, 8, 15, 26, 42, 64, 93, 130]
}
