fn proper_divisor_sum(n: u32) -> u32 {
    (1..n).filter(|d| n % d == 0).sum()
}

fn aliquot(start: u32) -> Vec<u32> {
    let mut seq = vec![start];
    while *seq.last().unwrap() != 0 {
        seq.push(proper_divisor_sum(*seq.last().unwrap()));
    }
    seq
}

fn main() {
    let strs: Vec<String> = aliquot(12).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
