// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
fn mobius(mut n: u32) -> i32 {
    let mut result = 1;
    let mut p = 2;
    while p * p <= n {
        if n % p == 0 {
            n /= p;
            if n % p == 0 {
                return 0;
            }
            result = -result;
        }
        p += 1;
    }
    if n > 1 { -result } else { result }
}

fn main() {
    let v: Vec<String> = (1..=30).map(|n| mobius(n).to_string()).collect();
    println!("{}", v.join(" "));
}
