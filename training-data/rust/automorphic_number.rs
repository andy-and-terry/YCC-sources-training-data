fn is_automorphic(n: u64) -> bool {
    (n * n).to_string().ends_with(&n.to_string())
}

fn main() {
    let v: Vec<u64> = (1..1000).filter(|&n| is_automorphic(n)).collect();
    println!("{:?}", v);
}
