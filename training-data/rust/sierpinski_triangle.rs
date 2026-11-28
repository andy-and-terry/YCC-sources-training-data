fn main() {
    let n = 8;
    for r in 0..n {
        let mut line = " ".repeat(n - r - 1);
        for c in 0..=r {
            line.push_str(if r & c == c { "* " } else { "  " });
        }
        println!("{line}");
    }
}
