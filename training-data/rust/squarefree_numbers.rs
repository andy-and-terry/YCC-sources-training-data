// Squarefree numbers up to 100; expect 61.
fn squarefree(n: u32) -> bool {
    let mut d = 2;
    while d * d <= n {
        if n % (d * d) == 0 {
            return false;
        }
        d += 1;
    }
    true
}

fn main() {
    println!("{}", (1..=100).filter(|&n| squarefree(n)).count());
}
