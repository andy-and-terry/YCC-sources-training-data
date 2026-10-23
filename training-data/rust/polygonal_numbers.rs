// n-th s-gonal number: ((s - 2) n^2 - (s - 4) n) / 2
fn polygonal(s: i32, n: i32) -> i32 {
    ((s - 2) * n * n - (s - 4) * n) / 2
}

fn main() {
    for (name, s) in [("triangular", 3), ("pentagonal", 5), ("hexagonal", 6)] {
        let nums: Vec<String> = (1..=10).map(|n| polygonal(s, n).to_string()).collect();
        println!("{}: {}", name, nums.join(" "));
    }
}
