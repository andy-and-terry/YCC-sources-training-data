use std::borrow::Cow;

// Only allocates a new String when the input actually needs escaping;
// otherwise it borrows the original data unchanged.
fn escape_spaces(input: &str) -> Cow<'_, str> {
    if input.contains(' ') {
        Cow::Owned(input.replace(' ', "_"))
    } else {
        Cow::Borrowed(input)
    }
}

fn main() {
    let plain = "no-spaces-here";
    let spaced = "hello world";

    let a = escape_spaces(plain);
    let b = escape_spaces(spaced);

    println!("{} (owned: {})", a, matches!(a, Cow::Owned(_)));
    println!("{} (owned: {})", b, matches!(b, Cow::Owned(_)));

    let inputs = vec!["clean", "needs fix", "also clean"];
    let processed: Vec<Cow<'_, str>> = inputs.iter().map(|s| escape_spaces(s)).collect();
    for p in &processed {
        println!("{}", p);
    }
}
