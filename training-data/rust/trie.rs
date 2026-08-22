use std::collections::HashMap;

#[derive(Default)]
struct TrieNode {
    children: HashMap<char, TrieNode>,
    is_word: bool,
}

struct Trie {
    root: TrieNode,
}

impl Trie {
    fn new() -> Self {
        Trie { root: TrieNode::default() }
    }

    fn insert(&mut self, word: &str) {
        let mut node = &mut self.root;
        for ch in word.chars() {
            node = node.children.entry(ch).or_insert_with(TrieNode::default);
        }
        node.is_word = true;
    }

    fn find(&self, s: &str) -> Option<&TrieNode> {
        let mut node = &self.root;
        for ch in s.chars() {
            node = node.children.get(&ch)?;
        }
        Some(node)
    }

    fn search(&self, word: &str) -> bool {
        self.find(word).map_or(false, |n| n.is_word)
    }

    fn starts_with(&self, prefix: &str) -> bool {
        self.find(prefix).is_some()
    }
}

fn main() {
    let mut trie = Trie::new();
    for word in ["cat", "car", "card", "care"] {
        trie.insert(word);
    }
    println!("{} {} {}", trie.search("car"), trie.search("ca"), trie.starts_with("ca"));
}
