use std::iter::FromIterator;

#[derive(Debug)]
struct SortedVec(Vec<i32>);

impl FromIterator<i32> for SortedVec {
    fn from_iter<I: IntoIterator<Item = i32>>(iter: I) -> Self {
        let mut v: Vec<i32> = iter.into_iter().collect();
        v.sort();
        SortedVec(v)
    }
}

impl Extend<i32> for SortedVec {
    fn extend<I: IntoIterator<Item = i32>>(&mut self, iter: I) {
        self.0.extend(iter);
        self.0.sort();
    }
}

fn main() {
    let s: SortedVec = vec![5, 3, 9, 1].into_iter().collect();
    println!("{:?}", s);

    let evens = (1..=10).filter(|n| n % 2 == 0).rev().collect::<SortedVec>();
    println!("{:?}", evens);

    let mut t = SortedVec::from_iter([4, 2]);
    t.extend([3, 1]);
    println!("{:?}", t);
}
