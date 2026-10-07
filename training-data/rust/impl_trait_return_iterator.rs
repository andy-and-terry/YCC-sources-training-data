// `impl Iterator<Item = T>` lets a function return a composed chain of
// adapters without naming its concrete (and often unnameable) type.
fn evens_up_to(n: u32) -> impl Iterator<Item = u32> {
    (0..=n).filter(|x| x % 2 == 0)
}

fn squares(iter: impl Iterator<Item = u32>) -> impl Iterator<Item = u32> {
    iter.map(|x| x * x)
}

fn running_totals(iter: impl Iterator<Item = u32>) -> impl Iterator<Item = u32> {
    let mut total = 0;
    iter.map(move |x| {
        total += x;
        total
    })
}

fn main() {
    let result: Vec<u32> = running_totals(squares(evens_up_to(10))).collect();
    println!("{:?}", result);
}
