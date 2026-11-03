use std::collections::BTreeMap;

fn count_vowels(s: &str) -> BTreeMap<char, usize> {
    let mut result = BTreeMap::new();
    for c in s.to_lowercase().chars().filter(|c| "aeiou".contains(*c)) {
        *result.entry(c).or_insert(0) += 1;
    }
    result
}

fn main() {
    println!("{:?}", count_vowels("Education is beautiful"));
}
