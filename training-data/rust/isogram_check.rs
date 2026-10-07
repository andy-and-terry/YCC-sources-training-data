use std::collections::HashSet;

fn is_isogram(s: &str) -> bool {
    let mut seen = HashSet::new();
    s.chars()
        .filter(|c| c.is_alphabetic())
        .all(|c| seen.insert(c.to_ascii_lowercase()))
}

fn main() {
    for w in ["lumberjacks", "background", "six-year-old", "isograms"] {
        println!("{w} {}", is_isogram(w));
    }
}
