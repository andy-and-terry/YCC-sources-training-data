fn digit_square_sum(n: i64) -> u64 {
    n.unsigned_abs()
        .to_string()
        .chars()
        .map(|c| c.to_digit(10).unwrap() as u64)
        .map(|d| d * d)
        .sum()
}

fn main() {
    println!("{}", digit_square_sum(123));
    println!("{}", digit_square_sum(-99));
}
