// Disarium numbers: digits raised to their 1-based positions sum to n.
fn is_disarium(n: u32) -> bool {
    let total: u32 = n
        .to_string()
        .chars()
        .enumerate()
        .map(|(i, c)| c.to_digit(10).unwrap().pow(i as u32 + 1))
        .sum();
    total == n
}

fn main() {
    let out: Vec<String> = (1..1000).filter(|&n| is_disarium(n)).map(|n| n.to_string()).collect();
    println!("{}", out.join(" "));
}
