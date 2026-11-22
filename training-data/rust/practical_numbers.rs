// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
fn is_practical(n: u32) -> bool {
    let mut reach: u64 = 1; // bit i set <=> i is a subset sum
    for d in 1..=n {
        if n % d == 0 {
            reach |= reach << d;
        }
    }
    let mask = (1u64 << (n + 1)) - 1;
    reach & mask == mask
}

fn main() {
    let out: Vec<String> = (1..=40).filter(|&n| is_practical(n)).map(|n| n.to_string()).collect();
    println!("{}", out.join(" "));
}
