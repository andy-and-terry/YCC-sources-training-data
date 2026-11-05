fn longest<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() >= b.len() { a } else { b }
}

struct Parser<'a> {
    input: &'a str,
}

impl<'a> Parser<'a> {
    fn first_word(&self) -> &'a str {
        self.input.split_whitespace().next().unwrap_or("")
    }
}

fn main() {
    println!("{}", longest("hello", "hi"));
    let p = Parser { input: "alpha beta" };
    println!("{}", p.first_word());
}
