fn describe(v: &[i32]) -> String {
    match v {
        [] => "empty".into(),
        [x] => format!("one {}", x),
        [first, .., last] if first == last => format!("bookends {}", first),
        [first, rest @ ..] => format!("{} then {} more", first, rest.len()),
    }
}

fn main() {
    for v in [&[][..], &[1], &[2, 5, 2], &[1, 2, 3]] { println!("{}", describe(v)); }
}
