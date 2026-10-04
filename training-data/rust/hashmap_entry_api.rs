use std::collections::HashMap;

fn main() {
    let text = "one two three two three three";
    let mut counts: HashMap<&str, usize> = HashMap::new();
    for word in text.split_whitespace() {
        *counts.entry(word).or_insert(0) += 1;
    }

    let mut sorted: Vec<_> = counts.iter().collect();
    sorted.sort_by(|a, b| b.1.cmp(a.1).then(a.0.cmp(b.0)));
    println!("{:?}", sorted);

    let mut groups: HashMap<usize, Vec<&str>> = HashMap::new();
    for word in text.split_whitespace() {
        groups.entry(word.len()).or_default().push(word);
    }
    let mut keys: Vec<_> = groups.keys().copied().collect();
    keys.sort();
    for k in keys {
        println!("{} -> {:?}", k, groups[&k]);
    }

    counts
        .entry("one")
        .and_modify(|c| *c += 10)
        .or_insert(1);
    counts.entry("four").and_modify(|c| *c += 10).or_insert(1);
    println!("one={} four={}", counts["one"], counts["four"]);

    if let Some(v) = counts.remove("two") {
        println!("removed two with {}", v);
    }
    println!("contains two: {}", counts.contains_key("two"));
}
