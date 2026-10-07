struct Pairwise<I: Iterator> {
    iter: I,
    prev: Option<I::Item>,
}

impl<I> Iterator for Pairwise<I>
where
    I: Iterator,
    I::Item: Clone,
{
    type Item = (I::Item, I::Item);

    fn next(&mut self) -> Option<Self::Item> {
        if self.prev.is_none() {
            self.prev = self.iter.next();
        }
        let next = self.iter.next()?;
        let prev = self.prev.replace(next.clone())?;
        Some((prev, next))
    }
}

trait PairwiseExt: Iterator + Sized {
    fn pairwise(self) -> Pairwise<Self> {
        Pairwise { iter: self, prev: None }
    }
}

impl<I: Iterator> PairwiseExt for I {}

fn main() {
    let deltas: Vec<i32> = [1, 4, 9, 16, 25].into_iter().pairwise().map(|(a, b)| b - a).collect();
    println!("{:?}", deltas);
}
