fn is_powerful(mut n: u32) -> bool {
    let mut p = 2;
    while p * p <= n {
        if n % p == 0 {
            if n % (p * p) != 0 {
                return false;
            }
            while n % p == 0 {
                n /= p;
            }
        }
        p += 1;
    }
    n == 1
}

fn main() {
    let result: Vec<String> = (1..=100)
        .filter(|&n| is_powerful(n))
        .map(|n| n.to_string())
        .collect();
    println!("{}", result.join(" "));
}
