fn duval(s: &str) -> Vec<&str> {
    let b = s.as_bytes();
    let (n, mut i) = (b.len(), 0);
    let mut out = Vec::new();
    while i < n {
        let (mut j, mut k) = (i + 1, i);
        while j < n && b[k] <= b[j] {
            k = if b[k] < b[j] { i } else { k + 1 };
            j += 1;
        }
        while i <= k {
            out.push(&s[i..i + j - k]);
            i += j - k;
        }
    }
    out
}

fn main() {
    println!("{:?}", duval("banana"));
}
