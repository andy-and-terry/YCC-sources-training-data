fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}

fn reverse_words(s: &str) -> String {
    s.split_whitespace().rev().collect::<Vec<_>>().join(" ")
}

fn main() {
    println!("{}", reverse_string("hello"));
    println!("{}", reverse_words("the quick brown fox"));
}
