const FACT: [u32; 10] = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];

fn is_factorion(n: u32) -> bool {
    let mut m = n;
    let mut sum = 0;
    while m > 0 {
        sum += FACT[(m % 10) as usize];
        m /= 10;
    }
    sum == n
}

fn main() {
    let found: Vec<u32> = (1..50_000).filter(|&n| is_factorion(n)).collect();
    println!("{:?}", found);
}
