// Repunits: numbers made only of the digit 1.
fn main() {
    let mut r: u64 = 0;
    for _ in 0..5 {
        r = r * 10 + 1;
        print!("{} ", r);
    }
    println!();
}
