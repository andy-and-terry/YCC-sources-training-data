// Reservoir sampling picks k items uniformly at random from a stream of
// unknown length while looking at each item exactly once.
fn reservoir_sample(stream: impl Iterator<Item = i32>, k: usize, seed: &mut u64) -> Vec<i32> {
    let mut next_rand = |bound: u64| {
        *seed = seed.wrapping_mul(6364136223846793005).wrapping_add(1);
        (*seed >> 33) % bound
    };

    let mut reservoir = Vec::with_capacity(k);
    for (i, item) in stream.enumerate() {
        if i < k {
            reservoir.push(item);
        } else {
            let j = next_rand((i + 1) as u64) as usize;
            if j < k {
                reservoir[j] = item;
            }
        }
    }
    reservoir
}

fn main() {
    let mut seed = 7u64;
    let sample = reservoir_sample(1..=100, 5, &mut seed);
    println!("{:?}", sample);
}
