fn catalan_sequence(count: usize) -> Vec<u64> {
    let mut c = vec![0u64; count.max(1)];
    c[0] = 1;
    for n in 1..count {
        let mut total = 0u64;
        for i in 0..n {
            total += c[i] * c[n - 1 - i];
        }
        c[n] = total;
    }
    c
}

fn main() {
    let seq = catalan_sequence(10);
    println!("{:?}", seq);
    assert_eq!(seq[0], 1);
    assert_eq!(seq[9], 4862);
}
