fn longest_valid(s: &str) -> usize {
    let scan = |it: &mut dyn Iterator<Item = char>, open: char| {
        let (mut l, mut r, mut best) = (0usize, 0usize, 0usize);
        for c in it {
            if c == open { l += 1 } else { r += 1 }
            if l == r {
                best = best.max(2 * r);
            } else if r > l {
                l = 0;
                r = 0;
            }
        }
        best
    };
    scan(&mut s.chars(), '(').max(scan(&mut s.chars().rev(), ')'))
}

fn main() {
    for s in ["(()", ")()())", "", "()(()", "((()))()"] {
        println!("{:?} {}", s, longest_valid(s));
    }
}
