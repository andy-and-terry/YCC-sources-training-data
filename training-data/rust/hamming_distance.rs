fn hamming_str(a: &str, b: &str) -> Result<usize, String> {
    if a.chars().count() != b.chars().count() {
        return Err(format!("length mismatch: {:?} vs {:?}", a, b));
    }
    Ok(a.chars().zip(b.chars()).filter(|(x, y)| x != y).count())
}

fn hamming_u64(x: u64, y: u64) -> u32 {
    (x ^ y).count_ones()
}

fn main() {
    println!("{:?} {} {}", hamming_str("karolin", "kathrin"), hamming_u64(1, 4), hamming_u64(u64::MAX, 0));
    match hamming_str("abc", "ab") {
        Ok(d) => println!("{}", d),
        Err(e) => println!("error: {}", e),
    }
}
