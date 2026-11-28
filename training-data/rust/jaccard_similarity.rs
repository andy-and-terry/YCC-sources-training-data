use std::collections::HashSet;

fn jaccard(a: &[i32], b: &[i32]) -> f64 {
    let a: HashSet<_> = a.iter().collect();
    let b: HashSet<_> = b.iter().collect();
    let union = a.union(&b).count();
    if union == 0 {
        return 1.0;
    }
    a.intersection(&b).count() as f64 / union as f64
}

fn main() {
    println!("{}", jaccard(&[1, 2, 3, 4], &[3, 4, 5]));
}
