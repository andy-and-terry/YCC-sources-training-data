fn plus_one(digits: &[u8]) -> Vec<u8> {
    let mut out = digits.to_vec();
    for d in out.iter_mut().rev() {
        if *d < 9 {
            *d += 1;
            return out;
        }
        *d = 0;
    }
    out.insert(0, 1);
    out
}

fn main() {
    println!("{:?}", plus_one(&[1, 2, 9])); // [1, 3, 0]
    println!("{:?}", plus_one(&[9, 9])); // [1, 0, 0]
}
