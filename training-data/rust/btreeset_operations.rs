use std::collections::BTreeSet;

fn main() {
    let a: BTreeSet<i32> = [1, 2, 3, 4, 5].into_iter().collect();
    let b: BTreeSet<i32> = [4, 5, 6, 7].into_iter().collect();

    println!("union: {:?}", a.union(&b).collect::<Vec<_>>());
    println!("intersection: {:?}", a.intersection(&b).collect::<Vec<_>>());
    println!("difference: {:?}", a.difference(&b).collect::<Vec<_>>());
    println!("sym diff: {:?}", a.symmetric_difference(&b).collect::<Vec<_>>());
    println!("first={:?} last={:?}", a.first(), a.last());
    println!("range 2..4: {:?}", a.range(2..4).collect::<Vec<_>>());
    println!("subset: {}", [4, 5].into_iter().collect::<BTreeSet<_>>().is_subset(&b));
}
