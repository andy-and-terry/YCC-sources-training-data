use std::collections::HashMap;

fn word_frequencies(text: &str) -> HashMap<&str, u32> {
    let mut counts: HashMap<&str, u32> = HashMap::new();
    for word in text.split_whitespace() {
        *counts.entry(word).or_insert(0) += 1;
    }
    counts
}

fn group_by_first_letter<'a>(words: &[&'a str]) -> HashMap<char, Vec<&'a str>> {
    let mut groups: HashMap<char, Vec<&str>> = HashMap::new();
    for &word in words {
        if let Some(first) = word.chars().next() {
            groups.entry(first).or_insert_with(Vec::new).push(word);
        }
    }
    groups
}

fn main() {
    let counts = word_frequencies("the quick brown fox jumps over the lazy fox");
    let mut pairs: Vec<_> = counts.into_iter().collect();
    pairs.sort();
    println!("{:?}", pairs);

    let groups = group_by_first_letter(&["apple", "avocado", "banana", "blueberry", "cherry"]);
    let mut keys: Vec<_> = groups.keys().copied().collect();
    keys.sort();
    for k in keys {
        println!("{}: {:?}", k, groups[&k]);
    }
}
