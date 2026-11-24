// Aliquot sequence: replace n by the sum of its proper divisors.
fn aliquot_sum(n: u32) -> u32 {
    (1..=n / 2).filter(|d| n % d == 0).sum()
}

fn main() {
    let mut seq = vec![12u32];
    while *seq.last().unwrap() > 1 && seq.len() < 20 {
        let next = aliquot_sum(*seq.last().unwrap());
        seq.push(next);
    }
    println!("{:?}", seq);
}
