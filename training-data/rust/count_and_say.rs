fn next_term(s: &str) -> String {
    let bytes = s.as_bytes();
    let mut out = String::with_capacity(bytes.len() * 2);
    let mut i = 0;
    while i < bytes.len() {
        let run = bytes[i..].iter().take_while(|&&b| b == bytes[i]).count();
        out.push_str(&run.to_string());
        out.push(bytes[i] as char);
        i += run;
    }
    out
}

fn main() {
    let terms: Vec<String> = std::iter::successors(Some("1".to_string()), |s| Some(next_term(s))).take(10).collect();
    for (i, t) in terms.iter().enumerate() {
        println!("{:2} {}", i + 1, t);
    }
}
