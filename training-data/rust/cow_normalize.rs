use std::borrow::Cow;

fn normalize(s: &str) -> Cow<str> {
    if s.contains(' ') {
        Cow::Owned(s.replace(' ', "_"))
    } else {
        Cow::Borrowed(s)
    }
}

fn main() {
    for s in ["hello", "hello world"] {
        match normalize(s) {
            Cow::Borrowed(b) => println!("borrowed: {}", b),
            Cow::Owned(o) => println!("owned: {}", o),
        }
    }
}
