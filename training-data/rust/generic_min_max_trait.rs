use std::fmt::Display;

fn largest<T: PartialOrd + Copy>(items: &[T]) -> Option<T> {
    let mut it = items.iter().copied();
    let first = it.next()?;
    Some(it.fold(first, |m, x| if x > m { x } else { m }))
}

fn describe<T>(items: &[T]) -> String
where
    T: Display,
{
    items.iter().map(|i| i.to_string()).collect::<Vec<_>>().join(", ")
}

struct Pair<T> {
    a: T,
    b: T,
}

impl<T: PartialOrd + Display> Pair<T> {
    fn show_larger(&self) {
        if self.a >= self.b {
            println!("larger: {}", self.a);
        } else {
            println!("larger: {}", self.b);
        }
    }
}

fn main() {
    println!("{:?} {:?}", largest(&[3, 9, 2]), largest::<f64>(&[]));
    println!("{:?}", largest(&['x', 'b', 'z']));
    println!("{}", describe(&[1.5, 2.5]));
    Pair { a: "pear", b: "apple" }.show_larger();
}
