use std::iter::{Product, Sum};
use std::ops::{Add, Mul};

#[derive(Debug, Clone, Copy, PartialEq)]
struct Money {
    cents: i64,
}

impl Add for Money {
    type Output = Money;
    fn add(self, other: Money) -> Money {
        Money { cents: self.cents + other.cents }
    }
}

impl Sum for Money {
    fn sum<I: Iterator<Item = Money>>(iter: I) -> Money {
        iter.fold(Money { cents: 0 }, |a, b| a + b)
    }
}

// Allow summing references too: `.iter().sum::<Money>()`.
impl<'a> Sum<&'a Money> for Money {
    fn sum<I: Iterator<Item = &'a Money>>(iter: I) -> Money {
        iter.copied().sum()
    }
}

#[derive(Debug, Clone, Copy)]
struct Factor(f64);

impl Mul for Factor {
    type Output = Factor;
    fn mul(self, other: Factor) -> Factor {
        Factor(self.0 * other.0)
    }
}

impl Product for Factor {
    fn product<I: Iterator<Item = Factor>>(iter: I) -> Factor {
        iter.fold(Factor(1.0), |a, b| a * b)
    }
}

fn main() {
    let prices = vec![Money { cents: 250 }, Money { cents: 199 }, Money { cents: 51 }];
    let by_ref: Money = prices.iter().sum();
    let by_val: Money = prices.into_iter().sum();
    println!("{:?} {}", by_ref, by_ref == by_val);

    let growth = [Factor(1.1), Factor(1.2), Factor(0.9)];
    let total: Factor = growth.iter().copied().product();
    println!("{:.3}", total.0);

    let empty: Money = Vec::<Money>::new().into_iter().sum();
    println!("{:?}", empty);
}
