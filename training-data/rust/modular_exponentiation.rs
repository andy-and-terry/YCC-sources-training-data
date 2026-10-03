fn mod_pow(mut base: u64, mut exponent: u64, modulus: u64) -> u64 {
    if modulus == 1 {
        return 0;
    }
    let mut result = 1u64;
    base %= modulus;
    while exponent > 0 {
        if exponent & 1 == 1 {
            result = result * base % modulus;
        }
        exponent >>= 1;
        base = base * base % modulus;
    }
    result
}

fn main() {
    println!("{}", mod_pow(2, 10, 1000));
    println!("{}", mod_pow(7, 128, 13));
}
