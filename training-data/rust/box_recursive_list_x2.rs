enum List { Cons(i32, Box<List>), Nil }
use List::*;

fn sum(l: &List) -> i32 { match l { Cons(v, rest) => v + sum(rest), Nil => 0 } }

fn main() { println!("{}", sum(&Cons(1, Box::new(Cons(2, Box::new(Nil)))))); }
