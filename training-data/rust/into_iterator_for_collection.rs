struct Bag { items: Vec<String> }

impl IntoIterator for Bag {
    type Item = String;
    type IntoIter = std::vec::IntoIter<String>;
    fn into_iter(self) -> Self::IntoIter { self.items.into_iter() }
}

impl<'a> IntoIterator for &'a Bag {
    type Item = &'a String;
    type IntoIter = std::slice::Iter<'a, String>;
    fn into_iter(self) -> Self::IntoIter { self.items.iter() }
}

fn main() {
    let b = Bag { items: vec!["x".into(), "y".into()] };
    for s in &b { print!("{} ", s); }
    for s in b { print!("{}! ", s); }
    println!();
}
