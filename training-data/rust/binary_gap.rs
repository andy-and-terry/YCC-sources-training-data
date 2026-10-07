fn binary_gap(mut n: u32) -> u32 {
    if n == 0 {
        return 0;
    }
    n >>= n.trailing_zeros();
    let mut best = 0;
    while n > 0 {
        n >>= 1;
        let zeros = n.trailing_zeros().min(32 - n.leading_zeros());
        if n == 0 {
            break;
        }
        best = best.max(zeros);
        n >>= zeros;
    }
    best
}

fn main() {
    for n in [9u32, 529, 20, 15, 1041] {
        println!("{n} {n:b} {}", binary_gap(n));
    }
}
