fn egg_drop(eggs: usize, floors: u64) -> u32 {
    let mut f = vec![0u64; eggs + 1];
    let mut moves = 0;
    while f[eggs] < floors {
        moves += 1;
        for e in (1..=eggs).rev() {
            f[e] = f[e].saturating_add(f[e - 1]).saturating_add(1);
        }
    }
    moves
}

fn main() {
    for (e, fl) in [(1, 10), (2, 100), (3, 1000), (10, 1_000_000_000_000_000)] {
        println!("{} eggs, {} floors -> {} drops", e, fl, egg_drop(e, fl));
    }
}
