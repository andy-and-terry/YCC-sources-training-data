fn justify(words: &[&str], width: usize) -> Vec<String> {
    let mut lines = Vec::new();
    let mut i = 0;
    while i < words.len() {
        let (mut j, mut len) = (i, 0);
        while j < words.len() && len + words[j].len() + (j - i) <= width {
            len += words[j].len();
            j += 1;
        }
        let gaps = j - i - 1;
        let line = if j == words.len() || gaps == 0 {
            format!("{:<width$}", words[i..j].join(" "), width = width)
        } else {
            let (spaces, extra) = ((width - len) / gaps, (width - len) % gaps);
            let mut s = String::new();
            for (k, w) in words[i..j - 1].iter().enumerate() {
                s.push_str(w);
                s.push_str(&" ".repeat(spaces + usize::from(k < extra)));
            }
            s + words[j - 1]
        };
        lines.push(line);
        i = j;
    }
    lines
}

fn main() {
    let words: Vec<&str> = "This is an example of text justification done greedily line by line".split(' ').collect();
    for l in justify(&words, 20) {
        println!("[{}]", l);
    }
}
