use std::collections::HashSet;

fn recaman(count: usize) -> Vec<i64> {
    let mut seq = vec![0i64];
    let mut seen: HashSet<i64> = HashSet::from([0]);
    for n in 1..count {
        let mut next = seq[n - 1] - n as i64;
        if next < 0 || seen.contains(&next) {
            next = seq[n - 1] + n as i64;
        }
        seq.push(next);
        seen.insert(next);
    }
    seq
}

fn main() {
    let strs: Vec<String> = recaman(20).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
