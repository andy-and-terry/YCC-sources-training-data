fn main() {
    let numbers = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    let sum_of_squares_of_evens: i32 = numbers
        .iter()
        .filter(|&&n| n % 2 == 0)
        .map(|&n| n * n)
        .sum();
    println!("{}", sum_of_squares_of_evens);

    let words = vec!["hello", "world", "rust", "is", "fun"];
    let longest = words.iter().max_by_key(|s| s.len()).unwrap();
    println!("{}", longest);

    let grouped: (Vec<i32>, Vec<i32>) = numbers.into_iter().partition(|&n| n % 2 == 0);
    println!("{:?}", grouped);

    let windows: Vec<i32> = vec![1, 2, 3, 4, 5]
        .windows(2)
        .map(|w| w[0] + w[1])
        .collect();
    println!("{:?}", windows);
}
