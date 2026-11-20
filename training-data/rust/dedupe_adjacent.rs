// Remove consecutive duplicates with Vec::dedup.
fn main() {
    let mut chars: Vec<char> = "aabbbcdd".chars().collect();
    chars.dedup();
    println!("{}", chars.into_iter().collect::<String>());
}
