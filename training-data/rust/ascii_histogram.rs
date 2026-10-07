use std::collections::BTreeMap;

fn histogram(s: &str, width: usize) -> String {
    let mut counts: BTreeMap<char, usize> = BTreeMap::new();
    for c in s.chars() {
        *counts.entry(c).or_default() += 1;
    }
    let peak = counts.values().copied().max().unwrap_or(1);
    counts
        .iter()
        .map(|(k, &n)| format!("{k} | {} {n}", "#".repeat((n * width / peak).max(1))))
        .collect::<Vec<_>>()
        .join("\n")
}

fn main() {
    println!("{}", histogram("theraininspainfallsmainlyontheplain", 30));
}
