// Square of the sum minus sum of squares for 1..10 (expect 2640)
fn main() {
    let sum: u32 = (1..=10).sum();
    let squares: u32 = (1..=10).map(|x| x * x).sum();
    println!("{}", sum * sum - squares);
}
