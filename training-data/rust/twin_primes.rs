// Twin primes below 50 using a sieve.
fn main() {
    let mut s = vec![true; 53];
    s[0] = false;
    s[1] = false;
    let mut i = 2;
    while i * i < 53 {
        if s[i] {
            let mut j = i * i;
            while j < 53 {
                s[j] = false;
                j += i;
            }
        }
        i += 1;
    }
    let pairs: Vec<(usize, usize)> = (2..=50).filter(|&p| s[p] && s[p + 2]).map(|p| (p, p + 2)).collect();
    println!("{:?}", pairs);
}
