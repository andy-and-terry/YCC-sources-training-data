fn letter_combinations(digits: &str) -> Vec<String> {
    const KEYS: [&str; 10] = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"];
    if digits.is_empty() {
        return vec![];
    }
    digits.bytes().fold(vec![String::new()], |acc, d| {
        let letters = KEYS[(d - b'0') as usize];
        acc.iter().flat_map(|prefix| letters.chars().map(move |c| format!("{}{}", prefix, c))).collect()
    })
}

fn main() {
    println!("{:?}", letter_combinations("23"));
    println!("{}", letter_combinations("7979").len());
}
