fn order(n: usize, k: usize) -> Vec<usize> {
    let mut pat: Vec<usize> = (0..k).collect();
    pat.extend((1..k - 1).rev());
    let mut idx: Vec<usize> = (0..n).collect();
    idx.sort_by_key(|&i| (pat[i % pat.len()], i));
    idx
}

fn encrypt(t: &str, k: usize) -> String {
    let b = t.as_bytes();
    order(b.len(), k).into_iter().map(|i| b[i] as char).collect()
}

fn decrypt(c: &str, k: usize) -> String {
    let b = c.as_bytes();
    let mut out = vec![b' '; b.len()];
    for (pos, i) in order(b.len(), k).into_iter().enumerate() {
        out[i] = b[pos];
    }
    String::from_utf8(out).unwrap()
}

fn main() {
    let c = encrypt("WEAREDISCOVERED", 3);
    println!("{} {}", c, decrypt(&c, 3));
}
