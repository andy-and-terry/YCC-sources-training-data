fn digit_sum(mut n: u64) -> u64 {
    let mut s = 0;
    while n > 0 {
        s += n % 10;
        n /= 10;
    }
    s
}

fn digital_root_iter(n: u64) -> u64 {
    std::iter::successors(Some(n), |&x| (x >= 10).then(|| digit_sum(x))).last().unwrap()
}

const fn digital_root(n: u64) -> u64 {
    if n == 0 { 0 } else { 1 + (n - 1) % 9 }
}

fn main() {
    for n in [0, 16, 942, 132189, 493193, u64::MAX] {
        println!("{} -> {} ({})", n, digital_root(n), if digital_root(n) == digital_root_iter(n) { "ok" } else { "MISMATCH" });
    }
}
