fn is_armstrong(n: u64) -> bool {
    let digits: Vec<u64> = n.to_string().bytes().map(|b| (b - b'0') as u64).collect();
    let k = digits.len() as u32;
    digits.iter().map(|d| d.pow(k)).sum::<u64>() == n
}

fn main() {
    let found: Vec<u64> = (1..10_000_000).filter(|&n| is_armstrong(n)).collect();
    println!("{:?}", found);
}
