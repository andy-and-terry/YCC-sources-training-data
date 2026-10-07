use std::collections::BTreeMap;
use std::ops::Mul;

#[derive(Debug, Default, Clone)]
struct Sparse {
    rows: usize,
    cols: usize,
    data: BTreeMap<(usize, usize), f64>,
}

impl Sparse {
    fn new(rows: usize, cols: usize) -> Self {
        Sparse { rows, cols, data: BTreeMap::new() }
    }

    fn set(&mut self, r: usize, c: usize, v: f64) {
        if v == 0.0 {
            self.data.remove(&(r, c));
        } else {
            self.data.insert((r, c), v);
        }
    }

    fn transpose(&self) -> Sparse {
        let mut t = Sparse::new(self.cols, self.rows);
        for (&(r, c), &v) in &self.data {
            t.set(c, r, v);
        }
        t
    }
}

impl Mul for &Sparse {
    type Output = Sparse;
    fn mul(self, o: &Sparse) -> Sparse {
        let mut out = Sparse::new(self.rows, o.cols);
        for (&(r, k), &a) in &self.data {
            for (&(_, c), &b) in o.data.range((k, 0)..(k + 1, 0)) {
                let cur = out.data.get(&(r, c)).copied().unwrap_or(0.0);
                out.set(r, c, cur + a * b);
            }
        }
        out
    }
}

fn main() {
    let mut a = Sparse::new(3, 3);
    let mut b = Sparse::new(3, 3);
    a.set(0, 0, 1.0);
    a.set(1, 2, 2.0);
    a.set(2, 1, 3.0);
    b.set(0, 1, 4.0);
    b.set(1, 0, 5.0);
    b.set(2, 2, 6.0);
    println!("{:?}", (&a * &b).data);
    println!("{:?}", a.transpose().data);
}
