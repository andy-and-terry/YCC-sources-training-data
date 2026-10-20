use std::borrow::Cow;

// Cow avoids allocating when no change is needed.
fn normalize(input: &str) -> Cow<'_, str> {
    if input.contains(' ') {
        Cow::Owned(input.replace(' ', "_"))
    } else {
        Cow::Borrowed(input)
    }
}

fn main() {
    for s in ["hello", "hello world"] {
        let out = normalize(s);
        let kind = match &out {
            Cow::Borrowed(_) => "borrowed",
            Cow::Owned(_) => "owned",
        };
        println!("{out} ({kind})");
    }
}
