fn is_pronic(n: u64) -> bool {
    let k = (n as f64).sqrt() as u64;
    k * (k + 1) == n
}

fn main() {
    let v: Vec<u64> = (0..100).filter(|&n| is_pronic(n)).collect();
    println!("{:?}", v);
}
