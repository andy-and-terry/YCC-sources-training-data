struct MinStack<T: Ord + Copy> {
    items: Vec<(T, T)>, // (value, min so far)
}

impl<T: Ord + Copy> MinStack<T> {
    fn new() -> Self {
        Self { items: Vec::new() }
    }
    fn push(&mut self, v: T) {
        let m = self.items.last().map_or(v, |&(_, m)| m.min(v));
        self.items.push((v, m));
    }
    fn pop(&mut self) -> Option<T> {
        self.items.pop().map(|(v, _)| v)
    }
    fn min(&self) -> Option<T> {
        self.items.last().map(|&(_, m)| m)
    }
}

fn main() {
    let mut s = MinStack::new();
    for v in [5, 3, 7, 2] {
        s.push(v);
    }
    println!("{:?}", s.min());
    s.pop();
    println!("{:?}", s.min());
}
