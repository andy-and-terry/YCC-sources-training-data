fn count_primes_below(n: usize) -> usize {
    if n < 3 {
        return 0;
    }
    let mut is_prime = vec![true; n];
    is_prime[0] = false;
    is_prime[1] = false;
    let mut i = 2;
    while i * i < n {
        if is_prime[i] {
            (i * i..n).step_by(i).for_each(|j| is_prime[j] = false);
        }
        i += 1;
    }
    is_prime.iter().filter(|&&p| p).count()
}

fn main() {
    println!("{}", count_primes_below(100));
}
