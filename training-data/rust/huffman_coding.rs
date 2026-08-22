use std::collections::{BinaryHeap, HashMap};
use std::cmp::Ordering;

#[derive(Eq, PartialEq)]
struct HuffNode {
    ch: Option<char>,
    freq: i32,
    left: Option<Box<HuffNode>>,
    right: Option<Box<HuffNode>>,
}

impl Ord for HuffNode {
    fn cmp(&self, other: &Self) -> Ordering {
        other.freq.cmp(&self.freq)
    }
}

impl PartialOrd for HuffNode {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

fn build_tree(text: &str) -> HuffNode {
    let mut counts = HashMap::new();
    for ch in text.chars() {
        *counts.entry(ch).or_insert(0) += 1;
    }
    let mut heap: BinaryHeap<HuffNode> = counts
        .into_iter()
        .map(|(ch, freq)| HuffNode { ch: Some(ch), freq, left: None, right: None })
        .collect();

    while heap.len() > 1 {
        let a = heap.pop().unwrap();
        let b = heap.pop().unwrap();
        heap.push(HuffNode { ch: None, freq: a.freq + b.freq, left: Some(Box::new(a)), right: Some(Box::new(b)) });
    }
    heap.pop().unwrap()
}

fn build_codes(node: &HuffNode, prefix: String, codes: &mut HashMap<char, String>) {
    if let Some(ch) = node.ch {
        codes.insert(ch, if prefix.is_empty() { "0".to_string() } else { prefix });
        return;
    }
    if let Some(left) = &node.left {
        build_codes(left, format!("{}0", prefix), codes);
    }
    if let Some(right) = &node.right {
        build_codes(right, format!("{}1", prefix), codes);
    }
}

fn encode(text: &str) -> String {
    let tree = build_tree(text);
    let mut codes = HashMap::new();
    build_codes(&tree, String::new(), &mut codes);
    text.chars().map(|ch| codes[&ch].clone()).collect()
}

fn main() {
    println!("{}", encode("abracadabra"));
}
