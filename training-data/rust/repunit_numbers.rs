// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
fn main() {
    let mut r: u64 = 0;
    let mut out = Vec::new();
    for _ in 0..8 {
        r = r * 10 + 1;
        out.push(r.to_string());
    }
    println!("{}", out.join(" "));
}
