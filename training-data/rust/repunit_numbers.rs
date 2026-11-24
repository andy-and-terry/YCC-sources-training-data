// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
fn main() {
    let mut r: u64 = 0;
    for _ in 1..=8 {
        r = r * 10 + 1;
        let note = if r % 3 == 0 { "  (divisible by 3)" } else { "" };
        println!("{}{}", r, note);
    }
}
