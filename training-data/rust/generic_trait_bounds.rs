use std::fmt::Display;
use std::cmp::PartialOrd;

fn largest<T: PartialOrd + Copy>(items: &[T]) -> T {
    let mut largest = items[0];
    for &item in items {
        if item > largest {
            largest = item;
        }
    }
    largest
}

fn print_all<T: Display>(items: &[T]) {
    for item in items {
        print!("{} ", item);
    }
    println!();
}

struct Pair<T> {
    first: T,
    second: T,
}

impl<T: PartialOrd + Display> Pair<T> {
    fn cmp_display(&self) {
        if self.first >= self.second {
            println!("The largest member is {}", self.first);
        } else {
            println!("The largest member is {}", self.second);
        }
    }
}

fn main() {
    println!("{}", largest(&[3, 7, 2, 9, 4]));
    println!("{}", largest(&[3.1, 7.2, 2.5]));
    print_all(&["a", "b", "c"]);
    let pair = Pair { first: 5, second: 10 };
    pair.cmp_display();
}
