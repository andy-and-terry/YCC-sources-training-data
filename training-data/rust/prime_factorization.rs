use std::collections::BTreeMap;
use std::fmt;

struct Factorization(BTreeMap<u64, u32>);

impl Factorization {
    fn of(mut n: u64) -> Self {
        let mut f = BTreeMap::new();
        let mut d = 2;
        while d * d <= n {
            while n % d == 0 {
                *f.entry(d).or_insert(0) += 1;
                n /= d;
            }
            d += if d == 2 { 1 } else { 2 };
        }
        if n > 1 {
            *f.entry(n).or_insert(0) += 1;
        }
        Factorization(f)
    }

    fn divisor_count(&self) -> u32 {
        self.0.values().map(|e| e + 1).product()
    }
}

impl fmt::Display for Factorization {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let parts: Vec<String> = self.0.iter().map(|(p, &e)| if e > 1 { format!("{}^{}", p, e) } else { p.to_string() }).collect();
        write!(f, "{}", parts.join(" * "))
    }
}

fn main() {
    for n in [360u64, 97, 1001, 82944, 600851475143] {
        let f = Factorization::of(n);
        println!("{} = {} ({} divisors)", n, f, f.divisor_count());
    }
}
