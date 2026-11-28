fn popcount(mut n: u64) -> u32 {
    let mut c = 0;
    while n != 0 {
        n &= n - 1;
        c += 1;
    }
    c
}

fn main() {
    let n = 0b10110111u64;
    println!("{} {}", popcount(n), n.count_ones());
}
