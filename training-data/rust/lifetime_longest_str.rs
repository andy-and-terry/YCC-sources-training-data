fn longest<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() >= b.len() {
        a
    } else {
        b
    }
}

struct Excerpt<'a> {
    part: &'a str,
}

impl<'a> Excerpt<'a> {
    fn first_word(&self) -> &'a str {
        self.part.split_whitespace().next().unwrap_or("")
    }
}

fn main() {
    let text = String::from("borrow checker keeps references valid");
    let ex = Excerpt { part: &text };
    println!("{}", longest(ex.first_word(), "check"));
}
