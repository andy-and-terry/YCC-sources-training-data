fn is_prime(n: u32) -> bool {
    n >= 2 && (2..).take_while(|i| i * i <= n).all(|i| n % i != 0)
}

fn reverse(mut n: u32) -> u32 {
    let mut r = 0;
    while n > 0 {
        r = r * 10 + n % 10;
        n /= 10;
    }
    r
}

fn main() {
    let v: Vec<u32> = (2..100)
        .filter(|&p| is_prime(p) && reverse(p) != p && is_prime(reverse(p)))
        .collect();
    println!("{:?}", v);
}
