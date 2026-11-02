fn longest<'a>(a: &'a str, b: &'a str) -> &'a str {
    if a.len() >= b.len() { a } else { b }
}

fn main() {
    let x = String::from("hello");
    let r;
    {
        let y = String::from("hi");
        r = longest(&x, &y).to_string();
    }
    println!("{r}");
}
