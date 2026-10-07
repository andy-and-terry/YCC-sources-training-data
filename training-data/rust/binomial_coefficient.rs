struct Binomial {
    modulus: u64,
    fact: Vec<u64>,
    inv: Vec<u64>,
}

impl Binomial {
    fn new(n: usize, modulus: u64) -> Self {
        let pow = |mut b: u64, mut e: u64| {
            let mut r = 1;
            while e > 0 {
                if e & 1 == 1 {
                    r = r * b % modulus;
                }
                b = b * b % modulus;
                e >>= 1;
            }
            r
        };
        let mut fact = vec![1u64; n + 1];
        for i in 1..=n {
            fact[i] = fact[i - 1] * i as u64 % modulus;
        }
        let mut inv = vec![1u64; n + 1];
        inv[n] = pow(fact[n], modulus - 2);
        for i in (1..=n).rev() {
            inv[i - 1] = inv[i] * i as u64 % modulus;
        }
        Binomial { modulus, fact, inv }
    }

    fn choose(&self, n: usize, k: usize) -> u64 {
        if k > n {
            return 0;
        }
        self.fact[n] * self.inv[k] % self.modulus * self.inv[n - k] % self.modulus
    }
}

fn choose_exact(n: u128, k: u128) -> u128 {
    let k = k.min(n - k);
    (1..=k).fold(1, |acc, i| acc * (n - k + i) / i)
}

fn main() {
    println!("{} {} {}", choose_exact(10, 3), choose_exact(52, 5), choose_exact(100, 50));
    let b = Binomial::new(1_000_000, 1_000_000_007);
    println!("{} {}", b.choose(1000, 500), (choose_exact(100, 50) % 1_000_000_007) as u64 == b.choose(100, 50));
}
