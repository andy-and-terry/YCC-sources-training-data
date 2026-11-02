fn describe(xs: &[i32]) -> String {
    match xs {
        [] => "empty".into(),
        [x] => format!("one {x}"),
        [first, .., last] => format!("{first}..{last}"),
    }
}

fn main() { println!("{} {} {}", describe(&[]), describe(&[7]), describe(&[1, 2, 3])); }
