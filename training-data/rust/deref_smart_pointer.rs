// Implementing Deref (and DerefMut) lets a wrapper type transparently
// behave like the value it wraps -- the same mechanism `Box<T>` itself
// relies on. Here a `Logged<T>` wrapper prints on every access while
// still letting callers use it as if it were a plain `T`.
use std::ops::{Deref, DerefMut};

struct Logged<T> {
    value: T,
}

impl<T> Logged<T> {
    fn new(value: T) -> Self {
        Logged { value }
    }
}

impl<T> Deref for Logged<T> {
    type Target = T;
    fn deref(&self) -> &T {
        println!("(read access)");
        &self.value
    }
}

impl<T> DerefMut for Logged<T> {
    fn deref_mut(&mut self) -> &mut T {
        println!("(write access)");
        &mut self.value
    }
}

fn shout(s: &str) -> String {
    format!("{}!", s.to_uppercase())
}

fn main() {
    let mut logged = Logged::new(String::from("hello"));

    // Deref coercion: `&Logged<String>` -> `&str` for the function call.
    println!("{}", shout(&logged));

    // Deref again for reading its length.
    println!("length: {}", logged.len());

    // DerefMut for a mutating method call.
    logged.push_str(" world");
    println!("{}", *logged);
}
