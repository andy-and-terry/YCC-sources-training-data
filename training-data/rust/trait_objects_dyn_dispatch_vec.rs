trait Animal {
    fn name(&self) -> String;
    fn speak(&self) -> String { format!("{} makes a sound", self.name()) }
}
struct Dog;
struct Cat;
impl Animal for Dog {
    fn name(&self) -> String { "dog".into() }
    fn speak(&self) -> String { "woof".into() }
}
impl Animal for Cat {
    fn name(&self) -> String { "cat".into() }
}

fn main() {
    let zoo: Vec<Box<dyn Animal>> = vec![Box::new(Dog), Box::new(Cat)];
    for a in &zoo {
        println!("{}", a.speak());
    }
}
