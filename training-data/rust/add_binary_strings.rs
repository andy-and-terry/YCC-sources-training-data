fn add_binary(a: &str, b: &str) -> String {
    let (a, b) = (a.as_bytes(), b.as_bytes());
    let (mut i, mut j, mut carry) = (a.len(), b.len(), 0u8);
    let mut out = Vec::new();
    while i > 0 || j > 0 || carry > 0 {
        let mut sum = carry;
        if i > 0 {
            i -= 1;
            sum += a[i] - b'0';
        }
        if j > 0 {
            j -= 1;
            sum += b[j] - b'0';
        }
        out.push(b'0' + sum % 2);
        carry = sum / 2;
    }
    out.reverse();
    String::from_utf8(out).unwrap()
}

fn main() {
    println!("{}", add_binary("1010", "1011")); // 10101
}
