fn classify(n: i32) -> &'static str {
    match n {
        i32::MIN..=-1 => "neg",
        0 => "zero",
        x @ 1..=9 if x % 2 == 0 => "small even",
        1..=9 => "small odd",
        _ => "big",
    }
}

fn main() {
    for n in [-5, 0, 4, 7, 50] { println!("{} {}", n, classify(n)); }
}
