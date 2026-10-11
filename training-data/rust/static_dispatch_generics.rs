trait Speak {
    fn speak(&self) -> String;
}

struct Dog;
struct Cat;

impl Speak for Dog {
    fn speak(&self) -> String { "woof".into() }
}
impl Speak for Cat {
    fn speak(&self) -> String { "meow".into() }
}

fn announce<T: Speak>(x: &T) {
    println!("static: {}", x.speak());
}

fn announce_impl(x: &impl Speak) {
    println!("impl: {}", x.speak());
}

fn announce_dyn(x: &dyn Speak) {
    println!("dyn: {}", x.speak());
}

fn main() {
    announce(&Dog);
    announce_impl(&Cat);
    let zoo: Vec<Box<dyn Speak>> = vec![Box::new(Dog), Box::new(Cat)];
    for z in &zoo {
        announce_dyn(z.as_ref());
    }
}
