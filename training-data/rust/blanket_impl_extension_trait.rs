use std::fmt::Display;

// A blanket impl gives every type that satisfies the bound the new method.
trait Shout {
    fn shout(&self) -> String;
}

impl<T: Display> Shout for T {
    fn shout(&self) -> String {
        format!("{}!", self.to_string().to_uppercase())
    }
}

// Extension trait adding methods to all iterators of numbers.
trait IterStats: Iterator<Item = f64> + Sized {
    fn mean(self) -> Option<f64> {
        let (sum, count) = self.fold((0.0, 0usize), |(s, c), x| (s + x, c + 1));
        if count == 0 {
            None
        } else {
            Some(sum / count as f64)
        }
    }
}

impl<I: Iterator<Item = f64>> IterStats for I {}

fn main() {
    println!("{}", "hello".shout());
    println!("{}", 42.shout());
    println!("{}", 'x'.shout());

    let data = vec![2.0, 4.0, 9.0];
    println!("{:?}", data.iter().copied().mean());
    println!("{:?}", std::iter::empty::<f64>().mean());
    println!("{:?}", (1..=4).map(|n| n as f64).mean());
}
