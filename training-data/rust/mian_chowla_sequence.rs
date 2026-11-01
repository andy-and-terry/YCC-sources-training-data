use std::collections::HashSet;

// Greedy sequence whose pairwise sums are all distinct.
fn main() {
    let mut seq: Vec<u32> = Vec::new();
    let mut sums: HashSet<u32> = HashSet::new();
    let mut cand = 1;
    while seq.len() < 8 {
        let mut fresh = HashSet::new();
        let ok = seq.iter().chain(std::iter::once(&cand)).all(|x| {
            let s = x + cand;
            !sums.contains(&s) && fresh.insert(s)
        });
        if ok {
            seq.push(cand);
            sums.extend(fresh);
        }
        cand += 1;
    }
    println!("{:?}", seq);
}
