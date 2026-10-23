fn stern(count: usize) -> Vec<u32> {
    let mut s = vec![0u32, 1];
    for i in 2..count {
        let next = if i % 2 == 0 { s[i / 2] } else { s[i / 2] + s[i / 2 + 1] };
        s.push(next);
    }
    s.truncate(count);
    s
}

fn main() {
    let strs: Vec<String> = stern(20).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
