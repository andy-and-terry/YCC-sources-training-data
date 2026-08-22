trait Greet {
    fn name(&self) -> String;

    fn greeting(&self) -> String {
        format!("Hello, {}!", self.name())
    }
}

struct Person {
    name: String,
}

impl Greet for Person {
    fn name(&self) -> String {
        self.name.clone()
    }
}

struct Robot;

impl Greet for Robot {
    fn name(&self) -> String {
        "Robot".to_string()
    }

    fn greeting(&self) -> String {
        format!("BEEP BOOP {}", self.name().to_uppercase())
    }
}

fn main() {
    let p = Person { name: "Alice".to_string() };
    let r = Robot;
    println!("{}", p.greeting());
    println!("{}", r.greeting());
}
