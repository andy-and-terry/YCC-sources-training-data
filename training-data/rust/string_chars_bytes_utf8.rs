fn main() {
    let s = "héllo, 世界";
    println!("bytes={} chars={}", s.len(), s.chars().count());
    for (i, c) in s.char_indices().filter(|(_, c)| !c.is_ascii()) {
        println!("{} at byte {} is {} bytes", c, i, c.len_utf8());
    }
    println!("{}", &s[0..1]);
    println!("{:?}", s.get(1..2)); // None: splits 'é'
    println!("{}", s.chars().rev().collect::<String>());
    println!("{}", s.to_uppercase());
    let bytes = s.as_bytes();
    println!("{:?}", std::str::from_utf8(&bytes[..3]));
    println!("{:?}", String::from_utf8_lossy(&bytes[..2]));
}
