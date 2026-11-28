struct SqrtSum {
    a: Vec<i64>,
    blk: Vec<i64>,
    bs: usize,
}

impl SqrtSum {
    fn new(a: Vec<i64>, bs: usize) -> Self {
        let blk = a.chunks(bs).map(|c| c.iter().sum()).collect();
        Self { a, blk, bs }
    }

    fn query(&self, l: usize, r: usize) -> i64 {
        let (mut s, mut i) = (0, l);
        while i <= r {
            if i % self.bs == 0 && i + self.bs - 1 <= r {
                s += self.blk[i / self.bs];
                i += self.bs;
            } else {
                s += self.a[i];
                i += 1;
            }
        }
        s
    }
}

fn main() {
    let t = SqrtSum::new(vec![5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4);
    println!("{}", t.query(2, 9));
}
