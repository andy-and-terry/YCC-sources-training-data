fn swap_case(s: &str) -> String {
    s.chars()
        .map(|c| {
            if c.is_uppercase() {
                c.to_lowercase().next().unwrap()
            } else {
                c.to_uppercase().next().unwrap()
            }
        })
        .collect()
}

fn main() {
    println!("{}", swap_case("Hello World 42"));
}
