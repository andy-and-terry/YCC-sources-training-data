fn mod_pow(mut base: u64, mut exp: u64, modulus: u64) -> u64 {
    let mut result = 1u64;
    base %= modulus;
    while exp > 0 {
        if exp & 1 == 1 {
            result = (result as u128 * base as u128 % modulus as u128) as u64;
        }
        base = (base as u128 * base as u128 % modulus as u128) as u64;
        exp >>= 1;
    }
    result
}

fn main() {
    println!("{}", mod_pow(2, 10, 1000));
    println!("{}", mod_pow(3, 200, 13));
    let p = 1_000_000_007u64;
    let inv = mod_pow(7, p - 2, p);
    println!("{} {}", inv, 7 * inv % p);
}
