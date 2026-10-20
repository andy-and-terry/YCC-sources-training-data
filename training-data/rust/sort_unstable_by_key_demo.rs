fn main() {
    let mut words = vec!["pear", "fig", "banana", "kiwi", "apple"];
    words.sort_unstable_by_key(|w| w.len());
    println!("{:?}", words.iter().map(|w| w.len()).collect::<Vec<_>>());

    let mut people = vec![("bo", 30), ("al", 25), ("cy", 30)];
    people.sort_by_key(|&(name, age)| (std::cmp::Reverse(age), name));
    println!("{:?}", people);

    let mut fs = vec![2.5, -1.0, 9.75, 0.0];
    fs.sort_by(|a, b| b.partial_cmp(a).unwrap());
    println!("{:?}", fs);
    fs.sort_by(f64::total_cmp);
    println!("{:?} {}", fs, fs.is_sorted());
}
