use std::cmp::Reverse;
use std::collections::BinaryHeap;

/// Lazily merges any number of sorted iterators.
struct KMerge<I: Iterator> {
    heap: BinaryHeap<Reverse<(I::Item, usize)>>,
    iters: Vec<I>,
}

impl<I> KMerge<I>
where
    I: Iterator,
    I::Item: Ord,
{
    fn new(mut iters: Vec<I>) -> Self {
        let mut heap = BinaryHeap::new();
        for (i, it) in iters.iter_mut().enumerate() {
            if let Some(x) = it.next() {
                heap.push(Reverse((x, i)));
            }
        }
        KMerge { heap, iters }
    }
}

impl<I> Iterator for KMerge<I>
where
    I: Iterator,
    I::Item: Ord,
{
    type Item = I::Item;
    fn next(&mut self) -> Option<I::Item> {
        let Reverse((x, i)) = self.heap.pop()?;
        if let Some(n) = self.iters[i].next() {
            self.heap.push(Reverse((n, i)));
        }
        Some(x)
    }
}

fn main() {
    let lists = vec![vec![1, 5, 9], vec![2, 6], vec![], vec![0, 3, 4, 10]];
    let merged: Vec<i32> = KMerge::new(lists.into_iter().map(|v| v.into_iter()).collect()).collect();
    println!("{:?}", merged);
    let evens = (0..).step_by(2).take(5);
    let threes = (0..).step_by(3).take(5);
    println!("{:?}", KMerge::new(vec![Box::new(evens) as Box<dyn Iterator<Item = i32>>, Box::new(threes)]).collect::<Vec<_>>());
}
