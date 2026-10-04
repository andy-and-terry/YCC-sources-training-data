fn main() {
    let s = "héllo wörld";
    println!("bytes: {}, chars: {}", s.len(), s.chars().count());

    for (i, c) in s.char_indices().filter(|(_, c)| !c.is_ascii()) {
        println!("non-ascii {} at byte {} ({} bytes)", c, i, c.len_utf8());
    }

    let first_word_end = s.find(' ').unwrap_or(s.len());
    println!("first word: {}", &s[..first_word_end]);
    println!("is_char_boundary(2): {}", s.is_char_boundary(2));

    let reversed: String = s.chars().rev().collect();
    println!("reversed: {}", reversed);

    let upper = s.to_uppercase();
    println!("upper: {}", upper);

    let bytes = "é".as_bytes();
    println!("utf8 of é: {:?}", bytes);
    println!("decoded: {}", String::from_utf8_lossy(bytes));
    println!("invalid: {}", String::from_utf8_lossy(&[0x68, 0xff, 0x69]));
}
