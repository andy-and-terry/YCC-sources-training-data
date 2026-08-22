struct SegmentTree {
    n: usize,
    tree: Vec<i32>,
}

impl SegmentTree {
    fn new(data: &[i32]) -> Self {
        let n = data.len();
        let mut tree = vec![0; 2 * n];
        tree[n..].copy_from_slice(data);
        for i in (1..n).rev() {
            tree[i] = tree[2 * i] + tree[2 * i + 1];
        }
        SegmentTree { n, tree }
    }

    fn update(&mut self, index: usize, value: i32) {
        let mut i = index + self.n;
        self.tree[i] = value;
        while i > 1 {
            i /= 2;
            self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1];
        }
    }

    fn query(&self, mut left: usize, mut right: usize) -> i32 {
        left += self.n;
        right += self.n;
        let mut total = 0;
        while left < right {
            if left % 2 == 1 {
                total += self.tree[left];
                left += 1;
            }
            if right % 2 == 1 {
                right -= 1;
                total += self.tree[right];
            }
            left /= 2;
            right /= 2;
        }
        total
    }
}

fn main() {
    let mut tree = SegmentTree::new(&[1, 3, 5, 7, 9, 11]);
    println!("{}", tree.query(1, 4));
    tree.update(1, 10);
    println!("{}", tree.query(1, 4));
}
