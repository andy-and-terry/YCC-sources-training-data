fn main() {
    let s = "héllo wörld";
    println!("bytes={} chars={}", s.len(), s.chars().count());
    println!("{}", &s[0..1]);
    println!("{:?}", s.char_indices().nth(2));
    println!("{}", s.chars().rev().collect::<String>());
    println!("{:?}", s.split_whitespace().collect::<Vec<_>>());
    println!("{}", s.replace("l", "L"));
    println!("{:?}", s.find('w'));
    println!("{}", s.starts_with("hé"));
    println!("{:?}", s.split_once(' '));
    println!("{}", "  pad ".trim());
    println!("{}", "ab".repeat(3));
    let caps: String = s
        .split(' ')
        .map(|w| {
            let mut c = w.chars();
            match c.next() {
                Some(f) => f.to_uppercase().collect::<String>() + c.as_str(),
                None => String::new(),
            }
        })
        .collect::<Vec<_>>()
        .join(" ");
    println!("{}", caps);
    println!("{}", s.is_char_boundary(2));
}
