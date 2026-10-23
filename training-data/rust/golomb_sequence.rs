// a(n) = 1 + a(n - a(a(n-1))), 1-based indexing
fn golomb(count: usize) -> Vec<usize> {
    let mut a = vec![0usize; count + 1];
    a[1] = 1;
    for n in 2..=count {
        a[n] = 1 + a[n - a[a[n - 1]]];
    }
    a[1..].to_vec()
}

fn main() {
    let strs: Vec<String> = golomb(20).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
