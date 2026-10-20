fn main() {
    let s = "--==hello==--";
    println!("{}", s.trim_matches(|c| c == '-' || c == '='));
    println!("{:?}", "prefix_body".strip_prefix("prefix_"));
    println!("{:?}", "file.tar.gz".strip_suffix(".gz"));
    println!("{:?}", "a=b=c".split_once('='));
    println!("{:?}", "a=b=c".rsplit_once('='));
    println!("{:?}", "a,b,,c".split(',').collect::<Vec<_>>());
    println!("{:?}", "a,b,,c".split_terminator(',').filter(|p| !p.is_empty()).collect::<Vec<_>>());
    println!("{:?}", "one  two\tthree\nfour".split_ascii_whitespace().collect::<Vec<_>>());
    println!("{:?}", "k1:v1;k2:v2".split(';').map(|kv| kv.split_once(':').unwrap()).collect::<Vec<_>>());
    println!("{:?}", "abcdef".splitn(3, 'c').collect::<Vec<_>>());
    println!("{} {}", "ß".to_uppercase(), "Hello".repeat(2));
    println!("{:?}", "x".char_indices().next());
}
