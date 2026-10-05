fn is_palindrome(s: &str) -> bool {
    let cleaned: Vec<char> = s
        .chars()
        .filter(|c| c.is_alphanumeric())
        .flat_map(|c| c.to_lowercase())
        .collect();
    cleaned.iter().eq(cleaned.iter().rev())
}

fn title_case(s: &str) -> String {
    s.split_whitespace()
        .map(|w| {
            let mut cs = w.chars();
            match cs.next() {
                Some(f) => f.to_uppercase().collect::<String>() + &cs.as_str().to_lowercase(),
                None => String::new(),
            }
        })
        .collect::<Vec<_>>()
        .join(" ")
}

fn main() {
    println!("{}", is_palindrome("A man, a plan, a canal: Panama"));
    println!("{}", title_case("hELLO wORLD from rust"));
    let s = "héllo";
    println!("{} bytes, {} chars", s.len(), s.chars().count());
    println!("{:?}", s.char_indices().nth(2));
    println!("{:?}", "a,b,,c".split(',').collect::<Vec<_>>());
    println!("{}", "abc".repeat(2).to_uppercase());
}
