// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
fn is_keith(n: u32) -> bool {
    let mut seq: Vec<u32> = n.to_string().chars().map(|c| c.to_digit(10).unwrap()).collect();
    let k = seq.len();
    while *seq.last().unwrap() < n {
        let next: u32 = seq[seq.len() - k..].iter().sum();
        seq.push(next);
    }
    *seq.last().unwrap() == n
}

fn main() {
    let out: Vec<String> = (10..1200).filter(|&n| is_keith(n)).map(|n| n.to_string()).collect();
    println!("{}", out.join(" "));
}
