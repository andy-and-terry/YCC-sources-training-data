fn main() {
    let words = vec!["hello world", "rust is fun"];
    let all: Vec<&str> = words.iter().flat_map(|s| s.split(' ')).collect();
    println!("{:?}", all);

    let nested = vec![vec![1, 2], vec![], vec![3], vec![4, 5, 6]];
    let flat: Vec<i32> = nested.into_iter().flatten().collect();
    println!("{:?}", flat);

    let opts = [Some(1), None, Some(3)];
    let present: Vec<i32> = opts.iter().flatten().copied().collect();
    println!("{:?}", present);

    let pairs: Vec<(i32, char)> = (1..=2).flat_map(|n| "ab".chars().map(move |c| (n, c))).collect();
    println!("{:?}", pairs);
}
