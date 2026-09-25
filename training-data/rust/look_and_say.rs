fn next_term(s: &str) -> String {
    let b = s.as_bytes();
    let mut out = String::new();
    let mut i = 0;
    while i < b.len() {
        let mut j = i;
        while j < b.len() && b[j] == b[i] {
            j += 1;
        }
        out.push_str(&(j - i).to_string());
        out.push(b[i] as char);
        i = j;
    }
    out
}

fn main() {
    let terms: Vec<String> = std::iter::successors(Some("1".to_string()), |s| Some(next_term(s))).take(8).collect();
    println!("{:?}", terms);
}
