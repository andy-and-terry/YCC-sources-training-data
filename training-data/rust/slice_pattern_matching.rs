fn describe(slice: &[i32]) -> String {
    match slice {
        [] => "empty".to_string(),
        [x] => format!("single element: {}", x),
        [first, .., last] if first == last => format!("bookends match: {}", first),
        [first, second, rest @ ..] => {
            format!("starts with {}, {} then {} more", first, second, rest.len())
        }
    }
}

fn main() {
    let cases: Vec<Vec<i32>> = vec![
        vec![],
        vec![42],
        vec![7, 1, 2, 7],
        vec![1, 2, 3, 4, 5],
    ];

    for case in &cases {
        println!("{}", describe(case));
    }

    let [a, b, ..] = [10, 20, 30, 40];
    println!("first two: {} {}", a, b);
}
