/// Iterator that yields balanced strings in lexicographic order without recursion.
struct Balanced {
    n: usize,
    current: Option<Vec<u8>>,
}

impl Balanced {
    fn new(n: usize) -> Self {
        let first = [vec![b'('; n], vec![b')'; n]].concat();
        Balanced { n, current: Some(first) }
    }

    /// Next balanced string in lexicographic order ('(' < ')'), or None after the last one.
    fn successor(s: &[u8]) -> Option<Vec<u8>> {
        let n = s.len() / 2;
        // Scan right to left for a '(' that can be flipped to ')' while keeping the prefix valid.
        for i in (0..s.len()).rev() {
            if s[i] != b'(' {
                continue;
            }
            let opens = s[..i].iter().filter(|&&b| b == b'(').count();
            let closes = i - opens;
            if closes < opens {
                let mut next = s[..i].to_vec();
                next.push(b')');
                next.extend(std::iter::repeat(b'(').take(n - opens));
                next.resize(2 * n, b')');
                return Some(next);
            }
        }
        None
    }
}

impl Iterator for Balanced {
    type Item = String;
    fn next(&mut self) -> Option<String> {
        let cur = self.current.take()?;
        self.current = if self.n == 0 { None } else { Balanced::successor(&cur) };
        Some(String::from_utf8(cur).unwrap())
    }
}

fn main() {
    println!("{:?}", Balanced::new(3).collect::<Vec<_>>());
    println!("n=10: {}", Balanced::new(10).count());
}
