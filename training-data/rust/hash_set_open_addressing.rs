use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

enum Slot<K> {
    Empty,
    Tombstone,
    Full(K),
}

struct OpenSet<K> {
    slots: Vec<Slot<K>>,
    len: usize,
    used: usize,
}

impl<K: Hash + Eq> OpenSet<K> {
    fn new() -> Self {
        OpenSet { slots: (0..8).map(|_| Slot::Empty).collect(), len: 0, used: 0 }
    }

    fn index(&self, k: &K) -> usize {
        let mut h = DefaultHasher::new();
        k.hash(&mut h);
        (h.finish() as usize) % self.slots.len()
    }

    fn find(&self, k: &K) -> Option<usize> {
        let cap = self.slots.len();
        let mut i = self.index(k);
        for _ in 0..cap {
            match &self.slots[i] {
                Slot::Empty => return None,
                Slot::Full(x) if x == k => return Some(i),
                _ => i = (i + 1) % cap,
            }
        }
        None
    }

    fn insert(&mut self, k: K) -> bool {
        if self.find(&k).is_some() {
            return false;
        }
        if (self.used + 1) * 2 > self.slots.len() {
            let new_cap = self.slots.len() * 2;
            let old = std::mem::replace(&mut self.slots, (0..new_cap).map(|_| Slot::Empty).collect());
            self.len = 0;
            self.used = 0;
            for s in old {
                if let Slot::Full(x) = s {
                    self.insert(x);
                }
            }
        }
        let mut i = self.index(&k);
        while let Slot::Full(_) = self.slots[i] {
            i = (i + 1) % self.slots.len();
        }
        if let Slot::Empty = self.slots[i] {
            self.used += 1;
        }
        self.slots[i] = Slot::Full(k);
        self.len += 1;
        true
    }

    fn remove(&mut self, k: &K) -> bool {
        match self.find(k) {
            Some(i) => {
                self.slots[i] = Slot::Tombstone;
                self.len -= 1;
                true
            }
            None => false,
        }
    }

    fn contains(&self, k: &K) -> bool {
        self.find(k).is_some()
    }
}

fn main() {
    let mut s = OpenSet::new();
    for w in "the quick brown fox jumps over the lazy dog".split(' ') {
        s.insert(w);
    }
    s.remove(&"fox");
    println!("{} {} {}", s.len, s.contains(&"fox"), s.contains(&"dog"));
}
