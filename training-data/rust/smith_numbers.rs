fn digit_sum(mut n: u64) -> u64 {
    let mut s = 0;
    while n > 0 {
        s += n % 10;
        n /= 10;
    }
    s
}

fn factor_digit_sum(mut n: u64) -> u64 {
    let mut total = 0;
    let mut d = 2;
    while n > 1 {
        while n % d == 0 {
            total += digit_sum(d);
            n /= d;
        }
        d += 1;
    }
    total
}

fn is_prime(n: u64) -> bool {
    n > 1 && (2..).take_while(|d| d * d <= n).all(|d| n % d != 0)
}

fn main() {
    let smiths: Vec<String> = (2..100u64)
        .filter(|&n| !is_prime(n) && digit_sum(n) == factor_digit_sum(n))
        .map(|n| n.to_string())
        .collect();
    println!("{}", smiths.join(" "));
}
