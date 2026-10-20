use std::borrow::Cow;

fn normalize(s: &str) -> Cow<str> {
    if s.contains(' ') { Cow::Owned(s.replace(' ', "_")) } else { Cow::Borrowed(s) }
}

fn main() {
    for s in ["a b c", "abc"] {
        let c = normalize(s);
        println!("{} {}", c, matches!(c, Cow::Borrowed(_)));
    }
}
