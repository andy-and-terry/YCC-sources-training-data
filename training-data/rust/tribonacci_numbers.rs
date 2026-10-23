// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
fn tribonacci(count: usize) -> Vec<u64> {
    let mut t: Vec<u64> = vec![0, 0, 1];
    while t.len() < count {
        let n = t.len();
        t.push(t[n - 1] + t[n - 2] + t[n - 3]);
    }
    t.truncate(count);
    t
}

fn main() {
    let terms: Vec<String> = tribonacci(15).iter().map(|x| x.to_string()).collect();
    println!("Tribonacci: {}", terms.join(", "));
}
