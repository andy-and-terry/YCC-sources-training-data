fn main() {
    let s = b"abcabc";
    let (k, b, m) = (3usize, 31u64, 1_000_003u64);
    let pw = (1..k).fold(1, |acc, _| acc * b % m);
    let mut h = s[..k].iter().fold(0, |h, &c| (h * b + c as u64) % m);
    println!("0 {h}");
    for i in 1..=s.len() - k {
        h = (h + m - s[i - 1] as u64 * pw % m) % m;
        h = (h * b + s[i + k - 1] as u64) % m;
        println!("{i} {h}");
    }
}
