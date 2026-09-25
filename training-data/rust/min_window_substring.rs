fn min_window<'a>(s: &'a str, t: &str) -> &'a str {
    let s_bytes = s.as_bytes();
    let mut need = [0i32; 256];
    for b in t.bytes() {
        need[b as usize] += 1;
    }
    let mut missing = t.len() as i32;
    let mut best: Option<(usize, usize)> = None;
    let mut left = 0;
    for (right, &b) in s_bytes.iter().enumerate() {
        if need[b as usize] > 0 {
            missing -= 1;
        }
        need[b as usize] -= 1;
        while missing == 0 {
            if best.is_none_or(|(l, r)| right + 1 - left < r - l) {
                best = Some((left, right + 1));
            }
            need[s_bytes[left] as usize] += 1;
            if need[s_bytes[left] as usize] > 0 {
                missing += 1;
            }
            left += 1;
        }
    }
    best.map_or("", |(l, r)| &s[l..r])
}

fn main() {
    println!("{:?} {:?}", min_window("ADOBECODEBANC", "ABC"), min_window("a", "aa"));
}
