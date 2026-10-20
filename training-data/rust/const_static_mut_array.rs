const PRIMES: [u32; 5] = [2, 3, 5, 7, 11];
static GREETING: &str = "hi";

const fn square(n: u32) -> u32 { n * n }
const SQ: u32 = square(12);

fn main() { println!("{} {} {}", PRIMES.iter().sum::<u32>(), GREETING, SQ); }
