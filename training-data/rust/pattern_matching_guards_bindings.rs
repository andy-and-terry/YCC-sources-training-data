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
    for n in [-5, 0, 4, 7, 100] { println!("{} {}", n, classify(n)); }
    let pair = (3, -3);
    match pair { (x, y) if x + y == 0 => println!("opposites"), (x, _) if x % 2 == 1 => println!("odd x"), _ => println!("other") }
}
