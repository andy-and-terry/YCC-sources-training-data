// Bulls and Cows scoring for equal-length digit strings.
use std::collections::HashMap;

fn score(secret: &str, guess: &str) -> (usize, usize) {
    let mut bulls = 0;
    let mut sc: HashMap<char, usize> = HashMap::new();
    let mut gc: HashMap<char, usize> = HashMap::new();
    for (s, g) in secret.chars().zip(guess.chars()) {
        if s == g {
            bulls += 1;
        } else {
            *sc.entry(s).or_insert(0) += 1;
            *gc.entry(g).or_insert(0) += 1;
        }
    }
    let cows = sc.iter().map(|(c, n)| (*n).min(*gc.get(c).unwrap_or(&0))).sum();
    (bulls, cows)
}

fn main() {
    let (b, c) = score("1807", "7810");
    println!("{} bull(s), {} cow(s)", b, c);
}
