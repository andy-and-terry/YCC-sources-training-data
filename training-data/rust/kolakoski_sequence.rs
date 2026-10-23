fn kolakoski(count: usize) -> Vec<u8> {
    let mut seq: Vec<u8> = vec![1, 2, 2];
    let mut i = 2;
    while seq.len() < count {
        let value = if seq[seq.len() - 1] == 2 { 1 } else { 2 };
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
