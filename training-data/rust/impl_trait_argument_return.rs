use std::fmt::Display;

fn describe(item: impl Display) -> String {
    format!("<{item}>")
}

fn evens(limit: u32) -> impl Iterator<Item = u32> {
    (0..limit).filter(|n| n % 2 == 0)
}

fn adder(k: i32) -> impl Fn(i32) -> i32 {
    move |x| x + k
}

fn main() {
    println!("{} {}", describe(5), describe("hi"));
    println!("{:?}", evens(10).collect::<Vec<_>>());
    println!("{}", adder(3)(4));
}
