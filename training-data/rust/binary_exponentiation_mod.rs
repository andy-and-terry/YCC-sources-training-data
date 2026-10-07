fn mod_pow(mut base: u64, mut exp: u64, m: u64) -> u64 {
    let mut result = 1u64;
    base %= m;
    while exp > 0 {
        if exp & 1 == 1 {
            result = (result as u128 * base as u128 % m as u128) as u64;
        }
        base = (base as u128 * base as u128 % m as u128) as u64;
        exp >>= 1;
    }
    result
}

fn main() {
    println!("{}", mod_pow(2, 10, 1000));
    println!("{}", mod_pow(3, 200, 13));
    println!("{}", mod_pow(7, 1_000_000_000_000, 1_000_000_007));
}
