fn is_pronic(x: u64) -> bool {
    let n = (x as f64).sqrt() as u64;
    n * (n + 1) == x
}

fn main() {
    let v: Vec<u64> = (0..10u64).map(|n| n * (n + 1)).collect();
    println!("{:?}", v); // [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
    println!("{} {}", is_pronic(56), is_pronic(57)); // true false
}
