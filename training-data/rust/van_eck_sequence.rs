use std::collections::HashMap;

fn van_eck(count: usize) -> Vec<usize> {
    let mut seq = vec![0usize];
    let mut last_seen: HashMap<usize, usize> = HashMap::new();
    for i in 0..count - 1 {
        let cur = seq[i];
        let next = match last_seen.get(&cur) {
            Some(&prev) => i - prev,
            None => 0,
        };
        last_seen.insert(cur, i);
        seq.push(next);
    }
    seq
}

fn main() {
    let strs: Vec<String> = van_eck(20).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
