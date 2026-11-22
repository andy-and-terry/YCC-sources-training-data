// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
fn fact(n: u64) -> u64 {
    (1..=n).product()
}

fn comb(n: u64, k: u64) -> u64 {
    fact(n) / (fact(k) * fact(n - k))
}

fn main() {
    let n = 5;
    let row: Vec<String> = (1..=n)
        .map(|k| (comb(n - 1, k - 1) * fact(n) / fact(k)).to_string())
        .collect();
    println!("{}", row.join(" "));
}
