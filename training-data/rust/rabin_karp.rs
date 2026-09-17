const BASE: u64 = 256;
const MODULUS: u64 = 1_000_000_007;

fn rabin_karp(text: &str, pattern: &str) -> Vec<usize> {
    let text = text.as_bytes();
    let pattern = pattern.as_bytes();
    let (n, m) = (text.len(), pattern.len());
    let mut matches = Vec::new();
    if m == 0 || m > n {
        return matches;
    }

    let mut high_order = 1u64;
    for _ in 0..m - 1 {
        high_order = (high_order * BASE) % MODULUS;
    }

    let hash_of = |bytes: &[u8]| -> u64 {
        bytes.iter().fold(0u64, |acc, &b| (acc * BASE + b as u64) % MODULUS)
    };

    let pattern_hash = hash_of(pattern);
    let mut window_hash = hash_of(&text[..m]);

    for i in 0..=n - m {
        if window_hash == pattern_hash && &text[i..i + m] == pattern {
            matches.push(i);
        }
        if i + m < n {
            window_hash = (window_hash + MODULUS - (text[i] as u64 * high_order) % MODULUS) % MODULUS;
            window_hash = (window_hash * BASE + text[i + m] as u64) % MODULUS;
        }
    }
    matches
}

fn main() {
    let text = "abracadabra abracadabra";
    let pattern = "abra";
    println!("matches of {:?} in {:?}: {:?}", pattern, text, rabin_karp(text, pattern));
}
