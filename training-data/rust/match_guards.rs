fn classify(n: i32) -> &'static str {
    match n {
        i32::MIN..=-1 => "negative",
        0 => "zero",
        x if x % 2 == 0 => "positive even",
        _ => "positive odd",
    }
}

fn main() {
    for n in [-5, 0, 4, 7] {
        println!("{} is {}", n, classify(n));
    }
    let pair = (3, -3);
    match pair {
        (x, y) if x + y == 0 => println!("opposites"),
        (x, _) if x % 2 == 1 => println!("first is odd"),
        _ => println!("no match"),
    }
}
