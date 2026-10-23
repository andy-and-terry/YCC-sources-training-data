fn main() {
    let out: Vec<String> = (0..10u64).map(|n| (n * (1u64 << n) + 1).to_string()).collect();
    println!("{}", out.join(" "));
}
