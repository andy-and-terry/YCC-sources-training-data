fn wrap(text: &str, width: usize) -> Vec<String> {
    let mut lines = Vec::new();
    let mut line = String::new();
    for mut word in text.split_whitespace() {
        while word.len() > width {
            if !line.is_empty() {
                lines.push(std::mem::take(&mut line));
            }
            let (head, tail) = word.split_at(width);
            lines.push(head.to_string());
            word = tail;
        }
        if line.is_empty() {
            line.push_str(word);
        } else if line.len() + 1 + word.len() <= width {
            line.push(' ');
            line.push_str(word);
        } else {
            lines.push(std::mem::replace(&mut line, word.to_string()));
        }
    }
    if !line.is_empty() {
        lines.push(line);
    }
    lines
}

fn main() {
    let text = "The quick brown fox jumps over the lazy dog and keeps running supercalifragilistically";
    for l in wrap(text, 16) {
        println!("|{:<16}|", l);
    }
}
