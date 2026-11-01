// Ways to write n as a sum of two or more consecutive positive integers.
fn polite_ways(n: u32) -> u32 {
    let mut ways = 0;
    let mut k = 2;
    while k * (k + 1) / 2 <= n {
        if (n - k * (k - 1) / 2) % k == 0 {
            ways += 1;
        }
        k += 1;
    }
    ways
}

fn main() {
    let v: Vec<String> = (1..=16).map(|n| polite_ways(n).to_string()).collect();
    println!("{}", v.join(" "));
}
