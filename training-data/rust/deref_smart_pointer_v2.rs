use std::ops::{Deref, DerefMut};

struct Wrapper<T> {
    inner: T,
    reads: std::cell::Cell<u32>,
}

impl<T> Wrapper<T> {
    fn new(inner: T) -> Self {
        Wrapper { inner, reads: std::cell::Cell::new(0) }
    }
}

impl<T> Deref for Wrapper<T> {
    type Target = T;
    fn deref(&self) -> &T {
        self.reads.set(self.reads.get() + 1);
        &self.inner
    }
}

impl<T> DerefMut for Wrapper<T> {
    fn deref_mut(&mut self) -> &mut T {
        &mut self.inner
    }
}

fn takes_str(s: &str) -> usize {
    s.len()
}

fn main() {
    let mut w = Wrapper::new(String::from("hello"));
    println!("{}", takes_str(&w)); // deref coercion: &Wrapper<String> -> &str
    w.push_str(" world");
    println!("{} {}", w.len(), w.reads.get());
    let mut v = Wrapper::new(vec![3, 1, 2]);
    v.sort();
    println!("{:?}", *v);
}
