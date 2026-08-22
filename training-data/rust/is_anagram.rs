fn is_anagram(a: &str, b: &str) -> bool {
    let normalize = |s: &str| {
        let mut chars: Vec<char> = s.to_lowercase().chars().filter(|c| !c.is_whitespace()).collect();
        chars.sort_unstable();
        chars
    };
    normalize(a) == normalize(b)
}

fn main() {
    println!("{}", is_anagram("listen", "silent"));
    println!("{}", is_anagram("hello", "world"));
}
