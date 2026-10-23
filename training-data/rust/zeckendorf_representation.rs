fn zeckendorf(mut n: u64) -> Vec<u64> {
    let mut fibs = vec![1u64, 2];
    while *fibs.last().unwrap() <= n {
        let len = fibs.len();
        fibs.push(fibs[len - 1] + fibs[len - 2]);
    }
    let mut parts = Vec::new();
    for &f in fibs.iter().rev() {
        if f <= n {
            parts.push(f);
            n -= f;
        }
    }
    parts
}

fn main() {
    let parts: Vec<String> = zeckendorf(100).iter().map(|x| x.to_string()).collect();
    println!("{}", parts.join(" "));
}
