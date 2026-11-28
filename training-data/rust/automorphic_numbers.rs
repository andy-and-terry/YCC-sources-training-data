fn is_automorphic(n: u64) -> bool {
    (n * n).to_string().ends_with(&n.to_string())
}

fn main() {
    let v: Vec<u64> = (0..1000).filter(|&n| is_automorphic(n)).collect();
    println!("{:?}", v); // [0, 1, 5, 6, 25, 76, 376, 625]
}
