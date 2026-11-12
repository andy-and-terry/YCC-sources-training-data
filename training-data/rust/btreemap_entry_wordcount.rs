use std::collections::BTreeMap;

fn main() {
    let text = "a b a c b a";
    let mut m: BTreeMap<&str, usize> = BTreeMap::new();
    for w in text.split_whitespace() {
        *m.entry(w).or_insert(0) += 1;
    }
    println!("{:?}", m);
}
