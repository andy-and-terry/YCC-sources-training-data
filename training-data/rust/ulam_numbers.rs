fn ulam(count: usize) -> Vec<u32> {
    let mut seq = vec![1, 2];
    let mut n = 2;
    while seq.len() < count {
        n += 1;
        let ways = seq.iter().filter(|&&a| a < n - a && seq.contains(&(n - a))).count();
        if ways == 1 {
            seq.push(n);
        }
    }
    seq
}

fn main() {
    let strs: Vec<String> = ulam(15).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
