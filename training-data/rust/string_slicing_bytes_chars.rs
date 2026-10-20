fn main() {
    let s = String::from("héllo");
    println!("{} {}", s.len(), s.chars().count());
    println!("{:?}", s.char_indices().map(|(i, _)| i).collect::<Vec<_>>());
    println!("{}", &s[0..1]);
    println!("{:?}", s.bytes().take(3).collect::<Vec<u8>>());
    println!("{}", s.chars().rev().collect::<String>());
    println!("{:?}", s.split_once('l'));
}
