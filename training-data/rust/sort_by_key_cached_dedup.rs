fn main() {
    let mut words = vec!["banana", "Apple", "cherry", "apple", "Banana"];
    words.sort_by_key(|w| w.to_lowercase());
    words.dedup_by_key(|w| w.to_lowercase());
    println!("{:?}", words);
    let mut fl = vec![2.5, -1.0, 9.75];
    fl.sort_by(|a, b| b.partial_cmp(a).unwrap());
    println!("{:?}", fl);
}
