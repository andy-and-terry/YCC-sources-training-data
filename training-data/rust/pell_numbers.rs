// P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
fn main() {
    let (mut a, mut b) = (0u64, 1u64);
    for i in 0..15 {
        println!("P({}) = {}", i, a);
        (a, b) = (b, 2 * b + a);
    }
}
