fn longest<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() >= b.len() { a } else { b }
}

struct Holder<'a> {
    part: &'a str,
}

fn main() {
    let s = String::from("hello world");
    let h = Holder { part: &s[..5] };
    println!("{} {}", longest("ab", "abc"), h.part);
}
