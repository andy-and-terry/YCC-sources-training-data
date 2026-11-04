fn interleave(parts: &[&str]) -> String {
    let mut iters: Vec<_> = parts.iter().map(|p| p.chars()).collect();
    let mut out = String::new();
    loop {
        let mut any = false;
        for it in iters.iter_mut() {
            if let Some(c) = it.next() {
                out.push(c);
                any = true;
            }
        }
        if !any {
            break;
        }
    }
    out
}

fn main() {
    println!("{}", interleave(&["abc", "12345"]));
    println!("{}", interleave(&["ab", "cd", "efg"]));
}
