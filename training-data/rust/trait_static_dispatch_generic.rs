use std::fmt::Display;

fn show_all<T: Display>(items: &[T]) -> String {
    items.iter().map(|i| i.to_string()).collect::<Vec<_>>().join(", ")
}

fn largest<T: PartialOrd + Copy>(xs: &[T]) -> T {
    let mut m = xs[0];
    for &x in xs { if x > m { m = x; } }
    m
}

fn main() {
    println!("{}", show_all(&[1, 2, 3]));
    println!("{} {}", largest(&[1.5, 0.2]), largest(&['a', 'z']));
}
