fn classify(n: i32) -> &'static str {
    match n {
        i32::MIN..=-1 => "negative",
        0 => "zero",
        x @ 1..=9 if x % 2 == 0 => "small even",
        1..=9 => "small odd",
        _ => "large",
    }
}

fn main() {
    for n in [-4, 0, 4, 7, 100] {
        println!("{} -> {}", n, classify(n));
    }
    let pair = (3, -3);
    if let (a, b) = pair {
        println!("{}", a + b == 0);
    }
}
