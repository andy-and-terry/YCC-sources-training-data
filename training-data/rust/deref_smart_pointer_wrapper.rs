use std::ops::{Deref, DerefMut};

struct Wrapper(Vec<i32>);
impl Deref for Wrapper { type Target = Vec<i32>; fn deref(&self) -> &Vec<i32> { &self.0 } }
impl DerefMut for Wrapper { fn deref_mut(&mut self) -> &mut Vec<i32> { &mut self.0 } }

fn main() {
    let mut w = Wrapper(vec![3, 1, 2]);
    w.push(0);
    w.sort();
    println!("{:?} {}", *w, w.len());
}
