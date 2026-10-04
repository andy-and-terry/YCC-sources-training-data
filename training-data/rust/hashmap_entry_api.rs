use std::collections::hash_map::Entry;
use std::collections::HashMap;

fn main() {
    let text = "the cat saw the dog and the cat ran";

    let mut counts: HashMap<&str, usize> = HashMap::new();
    for word in text.split_whitespace() {
        *counts.entry(word).or_insert(0) += 1;
    }
    let mut sorted: Vec<_> = counts.iter().collect();
    sorted.sort_by(|a, b| b.1.cmp(a.1).then(a.0.cmp(b.0)));
    println!("{:?}", sorted);

    let mut by_len: HashMap<usize, Vec<&str>> = HashMap::new();
    for word in text.split_whitespace() {
        by_len.entry(word.len()).or_default().push(word);
    }
    let mut lens: Vec<_> = by_len.keys().copied().collect();
    lens.sort();
    for l in lens {
        println!("{l}: {:?}", by_len[&l]);
    }

    let mut stock: HashMap<String, i32> = HashMap::new();
    stock.insert("apple".to_string(), 3);
    match stock.entry("apple".to_string()) {
        Entry::Occupied(mut e) => {
            *e.get_mut() += 10;
            println!("updated apple to {}", e.get());
        }
        Entry::Vacant(e) => {
            e.insert(1);
        }
    }
    stock.entry("pear".to_string()).and_modify(|n| *n += 1).or_insert(7);
    println!("{}", stock["pear"]);
}
