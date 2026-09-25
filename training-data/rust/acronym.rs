fn abbreviate(phrase: &str) -> String {
    phrase
        .split(|c: char| c.is_whitespace() || c == '-' || c == '_')
        .filter_map(|w| w.chars().find(|c| c.is_alphabetic()))
        .map(|c| c.to_ascii_uppercase())
        .collect()
}

fn main() {
    println!("{}", abbreviate("Portable Network Graphics"));
    println!("{}", abbreviate("Complementary metal-oxide semiconductor"));
}
