fn longest<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() >= b.len() { a } else { b }
}

fn main() {
    let s1 = String::from("hello");
    let res;
    {
        let s2 = String::from("hi");
        res = longest(&s1, &s2).to_string();
    }
    println!("{res}");
}
