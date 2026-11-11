// Amicable pairs: d(a) == b and d(b) == a with a != b.
fn d(n: u32) -> u32 {
    (1..n).filter(|i| n % i == 0).sum()
}

fn main() {
    for a in 2..1500 {
        let b = d(a);
        if b > a && d(b) == a {
            println!("({}, {})", a, b);
        }
    }
}
