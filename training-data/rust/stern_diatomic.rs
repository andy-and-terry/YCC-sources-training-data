fn stern(count: usize) -> Vec<u32> {
    let mut seq = vec![0u32; count.max(2)];
    seq[1] = 1;
    for i in 2..count {
        seq[i] = if i % 2 == 0 { seq[i / 2] } else { seq[i / 2] + seq[i / 2 + 1] };
    }
    seq.truncate(count);
    seq
}

fn main() {
    println!("{:?}", stern(15)); // [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
}
