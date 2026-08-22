struct Excerpt<'a> {
    text: &'a str,
}

impl<'a> Excerpt<'a> {
    fn announce_and_return(&self, announcement: &str) -> &str {
        println!("Attention: {}", announcement);
        self.text
    }
}

fn longest<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() > b.len() {
        a
    } else {
        b
    }
}

fn first_sentence(text: &str) -> &str {
    text.split('.').next().unwrap_or(text).trim()
}

fn main() {
    let novel = String::from("Call me Ishmael. Some years ago...");
    let first = first_sentence(&novel);
    let excerpt = Excerpt { text: first };
    println!("{}", excerpt.announce_and_return("important quote"));

    println!("{}", longest("short", "much longer string"));
}
