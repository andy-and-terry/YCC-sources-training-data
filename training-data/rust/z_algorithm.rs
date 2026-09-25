// The Z-array at index i is the length of the longest substring starting at i
// that matches a prefix of the string. It powers linear-time string matching.
fn z_function(s: &[u8]) -> Vec<usize> {
    let n = s.len();
    let mut z = vec![0usize; n];
    let (mut l, mut r) = (0usize, 0usize);

    for i in 1..n {
        if i < r {
            z[i] = std::cmp::min(r - i, z[i - l]);
        }
        while i + z[i] < n && s[z[i]] == s[i + z[i]] {
            z[i] += 1;
        }
        if i + z[i] > r {
            l = i;
            r = i + z[i];
        }
    }
    z
}

fn find_occurrences(text: &str, pattern: &str) -> Vec<usize> {
    let combined = format!("{}\x00{}", pattern, text);
    let z = z_function(combined.as_bytes());
    let plen = pattern.len();

    z.iter()
        .enumerate()
        .filter(|&(i, &value)| i > plen && value == plen)
        .map(|(i, _)| i - plen - 1)
        .collect()
}

fn main() {
    let text = "abxabcabcaby";
    let pattern = "abc";
    println!("{:?}", find_occurrences(text, pattern));
}
