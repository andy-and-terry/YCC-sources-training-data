fn largest<T: PartialOrd + Copy>(items: &[T]) -> Option<T> {
    let mut iter = items.iter().copied();
    let mut best = iter.next()?;
    for x in iter {
        if x > best {
            best = x;
        }
    }
    Some(best)
}

fn main() {
    println!("{:?}", largest(&[3, 9, 2]));
    println!("{:?}", largest(&[1.5, -2.0]));
    println!("{:?}", largest::<char>(&[]));
}
