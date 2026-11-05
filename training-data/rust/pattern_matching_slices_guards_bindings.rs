fn describe(xs: &[i32]) -> String {
    match xs {
        [] => "empty".to_string(),
        [x] => format!("one {}", x),
        [first, .., last] if first == last => format!("bookends {}", first),
        [first, rest @ ..] => format!("first {} then {} more", first, rest.len()),
    }
}

fn main() {
    for s in [&[][..], &[7], &[1, 2, 1], &[1, 2, 3]] {
        println!("{}", describe(s));
    }
    let n = 42u8;
    match n {
        0 => println!("zero"),
        x @ 1..=50 => println!("small {}", x),
        _ => println!("big"),
    }
}
