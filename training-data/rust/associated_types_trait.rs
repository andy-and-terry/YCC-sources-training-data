trait Container {
    type Item;
    fn items(&self) -> Vec<Self::Item>;
    fn first(&self) -> Option<Self::Item> {
        self.items().into_iter().next()
    }
}

struct Words(String);
struct Evens(u32);

impl Container for Words {
    type Item = String;
    fn items(&self) -> Vec<String> {
        self.0.split_whitespace().map(String::from).collect()
    }
}

impl Container for Evens {
    type Item = u32;
    fn items(&self) -> Vec<u32> {
        (0..self.0).filter(|n| n % 2 == 0).collect()
    }
}

fn count<C: Container>(c: &C) -> usize {
    c.items().len()
}

fn main() {
    let w = Words("the quick brown fox".to_string());
    let e = Evens(10);
    println!("{:?} {}", w.first(), count(&w));
    println!("{:?} {}", e.first(), count(&e));
}
