use std::collections::HashMap;
use std::hash::Hash;

struct DisjointSet<T: Eq + Hash + Clone> {
    parent: HashMap<T, T>,
    size: HashMap<T, usize>,
}

impl<T: Eq + Hash + Clone> DisjointSet<T> {
    fn new(elements: &[T]) -> Self {
        let mut parent = HashMap::new();
        let mut size = HashMap::new();
        for e in elements {
            parent.insert(e.clone(), e.clone());
            size.insert(e.clone(), 1);
        }
        DisjointSet { parent, size }
    }

    fn find(&mut self, x: T) -> T {
        let p = self.parent[&x].clone();
        if p != x {
            let root = self.find(p);
            self.parent.insert(x, root.clone());
            root
        } else {
            x
        }
    }

    fn union(&mut self, a: T, b: T) {
        let (mut root_a, mut root_b) = (self.find(a), self.find(b));
        if root_a == root_b {
            return;
        }
        if self.size[&root_a] < self.size[&root_b] {
            std::mem::swap(&mut root_a, &mut root_b);
        }
        self.parent.insert(root_b.clone(), root_a.clone());
        *self.size.get_mut(&root_a).unwrap() += self.size[&root_b];
    }

    fn connected(&mut self, a: T, b: T) -> bool {
        self.find(a) == self.find(b)
    }
}

fn main() {
    let mut ds = DisjointSet::new(&["a", "b", "c", "d"]);
    ds.union("a", "b");
    ds.union("b", "c");
    println!("{} {}", ds.connected("a", "c"), ds.connected("a", "d"));
}
