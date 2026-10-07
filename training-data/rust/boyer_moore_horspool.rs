fn horspool(text: &[u8], pattern: &[u8]) -> Vec<usize> {
    let (m, n) = (pattern.len(), text.len());
    if m == 0 || m > n {
        return vec![];
    }
    let mut shift = [m; 256];
    for (i, &b) in pattern[..m - 1].iter().enumerate() {
        shift[b as usize] = m - 1 - i;
    }
    let mut out = Vec::new();
    let mut i = 0;
    while i <= n - m {
        if &text[i..i + m] == pattern {
            out.push(i);
        }
        i += shift[text[i + m - 1] as usize];
    }
    out
}

fn main() {
    let text = "here is a simple example, an example indeed";
    println!("{:?} (str::find: {:?})", horspool(text.as_bytes(), b"example"), text.find("example"));
}
