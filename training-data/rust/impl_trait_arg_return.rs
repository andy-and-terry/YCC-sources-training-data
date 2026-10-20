fn evens(limit: u32) -> impl Iterator<Item = u32> { (0..limit).filter(|n| n % 2 == 0) }
fn total(it: impl Iterator<Item = u32>) -> u32 { it.sum() }
fn main() { println!("{}", total(evens(10))); }
