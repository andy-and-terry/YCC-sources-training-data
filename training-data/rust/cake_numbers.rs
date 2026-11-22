// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
fn main() {
    let out: Vec<String> = (0..10u32).map(|n| ((n.pow(3) + 5 * n + 6) / 6).to_string()).collect();
    println!("{}", out.join(" "));
}
