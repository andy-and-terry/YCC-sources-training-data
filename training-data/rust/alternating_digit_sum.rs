fn alternating_digit_sum(mut n: i64) -> i64 {
    let (mut total, mut sign) = (0, 1);
    while n > 0 {
        total += sign * (n % 10);
        sign = -sign;
        n /= 10;
    }
    total
}

fn main() {
    for n in [1234, 99999, 1000] {
        println!("{} {}", n, alternating_digit_sum(n));
    }
}
