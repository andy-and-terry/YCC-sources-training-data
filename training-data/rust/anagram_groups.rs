use std::collections::HashMap;

fn group_anagrams(words: &[&str]) -> Vec<Vec<String>> {
    let mut groups: HashMap<String, Vec<String>> = HashMap::new();
    for &word in words {
        let mut chars: Vec<char> = word.chars().collect();
        chars.sort_unstable();
        let key: String = chars.into_iter().collect();
        groups.entry(key).or_insert_with(Vec::new).push(word.to_string());
    }
    groups.into_values().collect()
}

fn main() {
    println!("{:?}", group_anagrams(&["eat", "tea", "tan", "ate", "nat", "bat"]));
}
