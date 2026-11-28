fn bitap(text: &str, pat: &str) -> Option<usize> {
    let mut masks = [0u64; 256];
    for (i, b) in pat.bytes().enumerate() {
        masks[b as usize] |= 1 << i;
    }
    let goal = 1u64 << (pat.len() - 1);
    let mut state = 0u64;
    for (i, b) in text.bytes().enumerate() {
        state = ((state << 1) | 1) & masks[b as usize];
        if state & goal != 0 {
            return Some(i + 1 - pat.len());
        }
    }
    None
}

fn main() {
    println!("{:?}", bitap("the quick brown fox", "brown"));
}
