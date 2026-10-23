use std::collections::hash_map::DefaultHasher;
use std::collections::HashSet;
use std::hash::{Hash, Hasher};

// Equality and hashing ignore case, so "Rust" and "rUST" are the same key.
#[derive(Debug, Clone)]
struct CaseInsensitive(String);

impl PartialEq for CaseInsensitive {
    fn eq(&self, other: &Self) -> bool {
        self.0.eq_ignore_ascii_case(&other.0)
    }
}
impl Eq for CaseInsensitive {}

impl Hash for CaseInsensitive {
    fn hash<H: Hasher>(&self, state: &mut H) {
        for b in self.0.bytes() {
            state.write_u8(b.to_ascii_lowercase());
        }
    }
}

fn hash_of<T: Hash>(value: &T) -> u64 {
    let mut h = DefaultHasher::new();
    value.hash(&mut h);
    h.finish()
}

fn main() {
    let a = CaseInsensitive("Rust".to_string());
    let b = CaseInsensitive("rUST".to_string());
    println!("{}", a == b);
    println!("{}", hash_of(&a) == hash_of(&b));

    let mut set = HashSet::new();
    for w in ["Apple", "APPLE", "banana", "Banana", "cherry"] {
        set.insert(CaseInsensitive(w.to_string()));
    }
    println!("{}", set.len());
}
