fn sum<const N: usize>(a: [i32; N]) -> i32 { a.iter().sum() }

fn main() { println!("{} {}", sum([1, 2, 3]), sum([10; 5])); }
