fn gcd(a: u64, b: u64) -> u64 {
    if b == 0 { a } else { gcd(b, a % b) }
}

fn gcd_all(nums: &[u64]) -> u64 {
    nums.iter().fold(0, |g, &n| gcd(g, n))
}

fn main() {
    println!("{}", gcd_all(&[12, 18, 24]));
    println!("{}", gcd_all(&[7, 13]));
}
