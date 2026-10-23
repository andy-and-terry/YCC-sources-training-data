// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
fn padovan(count: usize) -> Vec<u64> {
    let mut p = vec![1u64; count];
    for i in 3..count {
        p[i] = p[i - 2] + p[i - 3];
    }
    p
}

fn main() {
    println!("{:?}", padovan(15));
}
