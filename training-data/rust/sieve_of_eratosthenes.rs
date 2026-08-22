fn sieve(limit: usize) -> Vec<usize> {
    let mut is_prime = vec![true; limit + 1];
    is_prime[0] = false;
    if limit >= 1 {
        is_prime[1] = false;
    }
    let mut n = 2;
    while n * n <= limit {
        if is_prime[n] {
            let mut multiple = n * n;
            while multiple <= limit {
                is_prime[multiple] = false;
                multiple += n;
            }
        }
        n += 1;
    }
    is_prime.iter().enumerate().filter(|(_, &p)| p).map(|(i, _)| i).collect()
}

fn main() {
    println!("{:?}", sieve(50));
}
