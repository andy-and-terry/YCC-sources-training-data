use std::borrow::Borrow;
use std::collections::HashMap;
use std::path::Path;

fn byte_len<S: AsRef<str>>(s: S) -> usize {
    s.as_ref().len()
}

fn file_name<P: AsRef<Path>>(p: P) -> Option<String> {
    p.as_ref().file_name().map(|n| n.to_string_lossy().into_owned())
}

fn lookup<K: Borrow<str> + std::hash::Hash + Eq>(m: &HashMap<K, i32>, key: &str) -> Option<i32> {
    m.get(key).copied()
}

fn main() {
    println!("{} {}", byte_len("abc"), byte_len(String::from("hello")));
    println!("{:?} {:?}", file_name("/tmp/a/b.txt"), file_name(String::from("x.rs")));
    let mut m: HashMap<String, i32> = HashMap::new();
    m.insert("k".to_string(), 9);
    println!("{:?}", lookup(&m, "k"));
}
