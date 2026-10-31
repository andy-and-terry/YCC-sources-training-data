fn persistence(mut n: u64) -> u32 {
    let mut steps = 0;
    while n >= 10 {
        let mut product = 1;
        while n > 0 {
            product *= n % 10;
            n /= 10;
        }
        n = product;
        steps += 1;
    }
    steps
}

fn main() {
    for n in [39, 77, 999, 10] {
        println!("{} {}", n, persistence(n));
    }
}
