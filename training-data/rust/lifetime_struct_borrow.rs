struct Parser<'a> {
    input: &'a str,
}

impl<'a> Parser<'a> {
    fn first_word(&self) -> &'a str {
        self.input.split_whitespace().next().unwrap_or("")
    }
}

fn longest<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() >= b.len() { a } else { b }
}

fn main() {
    let text = String::from("hello brave new world");
    let word;
    {
        let p = Parser { input: &text };
        word = p.first_word();
    }
    println!("{}", word);
    println!("{}", longest("abc", "de"));
}
