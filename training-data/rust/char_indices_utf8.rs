// Strings are UTF-8: bytes, chars and grapheme-like units differ.
fn main() {
    let s = "héllo wörld";
    println!("bytes = {}, chars = {}", s.len(), s.chars().count());

    for (i, c) in s.char_indices().filter(|(_, c)| !c.is_ascii()) {
        println!("non-ascii {c:?} at byte {i} ({} bytes)", c.len_utf8());
    }

    let first_word_end = s.find(' ').unwrap_or(s.len());
    println!("first word: {}", &s[..first_word_end]);

    println!("{}", s.chars().rev().collect::<String>());
    println!("{}", s.to_uppercase());

    println!("{:?}", s.is_char_boundary(2));
    println!("{:?}", s.get(1..2));
    println!("{:?}", s.get(1..3));

    let title: String = s
        .split(' ')
        .map(|w| {
            let mut cs = w.chars();
            match cs.next() {
                Some(f) => f.to_uppercase().collect::<String>() + cs.as_str(),
                None => String::new(),
            }
        })
        .collect::<Vec<_>>()
        .join(" ");
    println!("{title}");

    let bytes = "AZ".bytes().map(|b| b + 1).collect::<Vec<u8>>();
    println!("{}", String::from_utf8(bytes).unwrap());
}
