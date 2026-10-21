// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
fn is_hamming(mut n: u32) -> bool {
    for p in [2, 3, 5] {
        while n % p == 0 {
            n /= p;
        }
    }
    n == 1
}

fn main() {
    let found: Vec<u32> = (1..).filter(|&n| is_hamming(n)).take(20).collect();
    println!("{:?}", found);
}
