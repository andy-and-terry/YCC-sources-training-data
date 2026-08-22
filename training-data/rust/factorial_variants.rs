fn factorial_recursive(n: u64) -> u64 {
    if n <= 1 {
        1
    } else {
        n * factorial_recursive(n - 1)
    }
}

fn factorial_iterative(n: u64) -> u64 {
    (2..=n).product::<u64>().max(1)
}

fn main() {
    println!("{} {}", factorial_recursive(5), factorial_iterative(5));
}
