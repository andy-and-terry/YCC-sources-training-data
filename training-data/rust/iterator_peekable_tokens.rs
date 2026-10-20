fn main() {
    let src = "12+34*5";
    let mut it = src.chars().peekable();
    let mut toks = Vec::new();
    while let Some(&c) = it.peek() {
        if c.is_ascii_digit() {
            let mut n = String::new();
            while let Some(&d) = it.peek() {
                if d.is_ascii_digit() { n.push(d); it.next(); } else { break; }
            }
            toks.push(n);
        } else {
            toks.push(c.to_string());
            it.next();
        }
    }
    println!("{:?}", toks);
}
