struct RangeSum {
    prefix: Vec<i64>,
}

impl RangeSum {
    fn new(values: &[i64]) -> Self {
        let mut prefix = vec![0];
        for v in values {
            prefix.push(prefix.last().unwrap() + v);
        }
        RangeSum { prefix }
    }

    fn query(&self, lo: usize, hi: usize) -> i64 {
        self.prefix[hi] - self.prefix[lo]
    }
}

fn main() {
    let rs = RangeSum::new(&[3, 1, 4, 1, 5, 9, 2, 6]);
    println!("{}", rs.query(2, 5));
}
