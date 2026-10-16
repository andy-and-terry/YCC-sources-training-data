const fn factorial(n: u64) -> u64 {
    let mut acc = 1;
    let mut i = 2;
    while i <= n {
        acc *= i;
        i += 1;
    }
    acc
}

const fn fib_table<const N: usize>() -> [u64; N] {
    let mut t = [0u64; N];
    if N > 1 {
        t[1] = 1;
    }
    let mut i = 2;
    while i < N {
        t[i] = t[i - 1] + t[i - 2];
        i += 1;
    }
    t
}

const FACT_10: u64 = factorial(10);
static FIBS: [u64; 12] = fib_table::<12>();

fn main() {
    println!("10! = {}", FACT_10);
    println!("{:?}", FIBS);
}
