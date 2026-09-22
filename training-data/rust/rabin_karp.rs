// Rabin-Karp compares rolling hashes instead of raw substrings, so a
// mismatching window is usually rejected in O(1) rather than O(m).
const BASE: u64 = 256;
const MOD: u64 = 1_000_000_007;

fn rabin_karp(text: &str, pattern: &str) -> Vec<usize> {
    let text: Vec<u8> = text.bytes().collect();
    let pattern: Vec<u8> = pattern.bytes().collect();
    let (n, m) = (text.len(), pattern.len());
    if m == 0 || m > n {
        return Vec::new();
    }

    let mut high_order = 1u64;
    for _ in 0..m - 1 {
        high_order = (high_order * BASE) % MOD;
    }

    let mut pattern_hash = 0u64;
    let mut window_hash = 0u64;
    for i in 0..m {
        pattern_hash = (pattern_hash * BASE + pattern[i] as u64) % MOD;
        window_hash = (window_hash * BASE + text[i] as u64) % MOD;
    }

    let mut matches = Vec::new();
    for i in 0..=n - m {
        if window_hash == pattern_hash && &text[i..i + m] == &pattern[..] {
            matches.push(i);
        }
        if i < n - m {
            window_hash = (window_hash + MOD - (text[i] as u64 * high_order) % MOD) % MOD;
            window_hash = (window_hash * BASE + text[i + m] as u64) % MOD;
        }
    }
    matches
}

fn main() {
    println!("{:?}", rabin_karp("abxabcabcaby", "abcaby"));
    println!("{:?}", rabin_karp("aaaaa", "aa"));
    println!("{:?}", rabin_karp("abc", "xyz"));
}
