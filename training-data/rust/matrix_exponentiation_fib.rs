use std::ops::Mul;

const MOD: u64 = 1_000_000_007;

#[derive(Clone, Copy)]
struct M2([[u64; 2]; 2]);

impl Mul for M2 {
    type Output = M2;
    fn mul(self, o: M2) -> M2 {
        let mut c = [[0u64; 2]; 2];
        for i in 0..2 {
            for j in 0..2 {
                for k in 0..2 {
                    c[i][j] = (c[i][j] + self.0[i][k] * o.0[k][j]) % MOD;
                }
            }
        }
        M2(c)
    }
}

fn fib(mut n: u64) -> u64 {
    let (mut r, mut m) = (M2([[1, 0], [0, 1]]), M2([[1, 1], [1, 0]]));
    while n > 0 {
        if n & 1 == 1 {
            r = r * m;
        }
        m = m * m;
        n >>= 1;
    }
    r.0[0][1]
}

fn main() {
    let first: Vec<u64> = (0..15).map(fib).collect();
    println!("{:?}", first);
    println!("fib(1e18) mod p = {}", fib(1_000_000_000_000_000_000));
}
