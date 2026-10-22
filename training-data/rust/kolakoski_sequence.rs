fn kolakoski(count: usize) -> Vec<u32> {
    let mut seq = vec![1, 2, 2];
    let mut i = 2;
    while seq.len() < count {
        let value = 3 - seq[seq.len() - 1];
        for _ in 0..seq[i] {
            seq.push(value);
        }
        i += 1;
    }
    seq.truncate(count);
    seq
}

fn main() {
    let strs: Vec<String> = kolakoski(20).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
