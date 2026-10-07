fn hamming(a: &str, b: &str) -> Option<usize> {
    (a.len() == b.len()).then(|| a.chars().zip(b.chars()).filter(|(x, y)| x != y).count())
}

fn main() {
    println!("{:?}", hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"));
    println!("{:?}", hamming("AB", "A"));
}
