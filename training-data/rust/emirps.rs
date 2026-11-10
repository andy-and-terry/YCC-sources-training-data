fn is_prime(n: u64) -> bool {
    n >= 2 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn reverse(mut n: u64) -> u64 {
    let mut r = 0;
    while n > 0 {
        r = r * 10 + n % 10;
        n /= 10;
    }
    r
}

fn main() {
    let out: Vec<u64> = (2..)
        .filter(|&n| {
            let r = reverse(n);
            r != n && is_prime(n) && is_prime(r)
        })
        .take(10)
        .collect();
    println!("{:?}", out); // [13, 17, 31, 37, 71, 73, 79, 97, 107, 113]
}
