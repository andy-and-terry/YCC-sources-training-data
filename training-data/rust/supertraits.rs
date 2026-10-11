use std::fmt::{self, Display};

trait Named {
    fn name(&self) -> String;
}

trait Greeter: Named + Display {
    fn greet(&self) -> String {
        format!("Hello, {} ({})", self.name(), self)
    }
}

struct User {
    id: u32,
    name: String,
}

impl Named for User {
    fn name(&self) -> String { self.name.clone() }
}

impl Display for User {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "user#{}", self.id)
    }
}

impl Greeter for User {}

fn main() {
    let u = User { id: 7, name: "Dana".into() };
    println!("{}", u.greet());
}
