use std::collections::HashMap;

fn word_frequency(text: &str) -> HashMap<String, u32> {
    let mut counts = HashMap::new();
    for word in text.split_whitespace() {
        let cleaned: String = word.chars().filter(|c| c.is_alphanumeric()).collect::<String>().to_lowercase();
        if !cleaned.is_empty() {
            *counts.entry(cleaned).or_insert(0) += 1;
        }
    }
    counts
}

fn main() {
    let text = "the quick brown fox jumps over the lazy dog. The dog barks!";
    let counts = word_frequency(text);
    let mut pairs: Vec<(&String, &u32)> = counts.iter().collect();
    pairs.sort_by(|a, b| b.1.cmp(a.1).then(a.0.cmp(b.0)));
    for (word, count) in pairs {
        println!("{word}: {count}");
    }
}
