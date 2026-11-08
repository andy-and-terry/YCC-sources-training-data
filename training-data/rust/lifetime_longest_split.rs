fn first_word<'a>(s: &'a str) -> &'a str {
    s.split_whitespace().next().unwrap_or("")
}

fn longer<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() >= b.len() { a } else { b }
}

fn main() {
    let text = String::from("hello brave new world");
    let w = first_word(&text);
    println!("{}", longer(w, "hi"));
}
