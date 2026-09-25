use std::collections::{HashSet, VecDeque};

// Breadth-first search over an implicit graph where two words are connected
// if they differ by exactly one letter, finding the shortest transformation.
fn word_ladder_length(begin: &str, end: &str, word_list: &[&str]) -> usize {
    let mut dict: HashSet<&str> = word_list.iter().copied().collect();
    if !dict.contains(end) {
        return 0;
    }
    dict.remove(begin);

    let mut queue: VecDeque<(String, usize)> = VecDeque::new();
    queue.push_back((begin.to_string(), 1));

    while let Some((word, steps)) = queue.pop_front() {
        if word == end {
            return steps;
        }
        let bytes = word.as_bytes();
        for i in 0..bytes.len() {
            let original = bytes[i];
            for c in b'a'..=b'z' {
                if c == original {
                    continue;
                }
                let mut next_bytes = bytes.to_vec();
                next_bytes[i] = c;
                let next_word = String::from_utf8(next_bytes).unwrap();
                if dict.remove(next_word.as_str()) {
                    queue.push_back((next_word, steps + 1));
                }
            }
        }
    }
    0
}

fn main() {
    let word_list = vec!["hot", "dot", "dog", "lot", "log", "cog"];
    println!("{}", word_ladder_length("hit", "cog", &word_list));
}
