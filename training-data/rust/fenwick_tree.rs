struct FenwickTree {
    tree: Vec<i32>,
    size: usize,
}

impl FenwickTree {
    fn new(size: usize) -> Self {
        FenwickTree { tree: vec![0; size + 1], size }
    }

    fn add(&mut self, index: usize, delta: i32) {
        let mut i = index + 1;
        while i <= self.size {
            self.tree[i] += delta;
            i += i & i.wrapping_neg();
        }
    }

    fn prefix_sum(&self, index: usize) -> i32 {
        let mut i = index + 1;
        let mut total = 0;
        while i > 0 {
            total += self.tree[i];
            i -= i & i.wrapping_neg();
        }
        total
    }

    fn range_sum(&self, left: usize, right: usize) -> i32 {
        if left > 0 {
            self.prefix_sum(right) - self.prefix_sum(left - 1)
        } else {
            self.prefix_sum(right)
        }
    }
}

fn main() {
    let mut ft = FenwickTree::new(6);
    for (i, &v) in [1, 3, 5, 7, 9, 11].iter().enumerate() {
        ft.add(i, v);
    }
    println!("{}", ft.range_sum(1, 3));
}
