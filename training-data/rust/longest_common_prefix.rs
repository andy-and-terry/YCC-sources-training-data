fn longest_common_prefix<'a>(words: &[&'a str]) -> &'a str {
    let Some(first) = words.first() else { return "" };
    let mut len = first.len();
    for w in &words[1..] {
        len = first.bytes().zip(w.bytes()).take(len).take_while(|(a, b)| a == b).count();
    }
    // keep the slice on a char boundary for non-ASCII input
    while !first.is_char_boundary(len) {
        len -= 1;
    }
    &first[..len]
}

fn main() {
    println!("{:?}", longest_common_prefix(&["flower", "flow", "flight"]));
    println!("{:?}", longest_common_prefix(&["dog", "racecar", "car"]));
    println!("{:?}", longest_common_prefix(&["über", "übel"]));
}
