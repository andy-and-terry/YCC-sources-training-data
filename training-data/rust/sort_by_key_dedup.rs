fn main() {
    let mut words = vec!["pear", "fig", "apple", "kiwi", "fig", "plum"];
    words.sort_by_key(|w| (w.len(), *w));
    println!("{:?}", words);
    words.dedup();
    println!("{:?}", words);
    words.sort_unstable_by(|a, b| b.cmp(a));
    println!("{:?}", words);
    words.retain(|w| w.len() > 3);
    println!("{:?}", words);

    let mut nums = vec![3.2, 1.5, 2.7];
    nums.sort_by(|a, b| a.partial_cmp(b).unwrap());
    println!("{:?}", nums);

    let v = vec![1, 3, 5, 7, 9];
    println!("{:?}", v.binary_search(&7));
    println!("{:?}", v.binary_search(&4));
    println!("{:?}", v.chunks(2).collect::<Vec<_>>());
    println!("{:?}", v.windows(2).map(|w| w[1] - w[0]).collect::<Vec<_>>());
    println!("{:?}", v.iter().rev().skip(1).step_by(2).collect::<Vec<_>>());
}
