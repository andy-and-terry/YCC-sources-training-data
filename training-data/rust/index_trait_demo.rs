// Implementing Index/IndexMut lets a custom type support `matrix[(r, c)]`
// syntax directly, on top of a flat backing Vec.
use std::ops::{Index, IndexMut};

struct Matrix {
    rows: usize,
    cols: usize,
    data: Vec<f64>,
}

impl Matrix {
    fn zeros(rows: usize, cols: usize) -> Self {
        Matrix { rows, cols, data: vec![0.0; rows * cols] }
    }
}

impl Index<(usize, usize)> for Matrix {
    type Output = f64;
    fn index(&self, (r, c): (usize, usize)) -> &f64 {
        assert!(r < self.rows && c < self.cols, "index out of bounds");
        &self.data[r * self.cols + c]
    }
}

impl IndexMut<(usize, usize)> for Matrix {
    fn index_mut(&mut self, (r, c): (usize, usize)) -> &mut f64 {
        assert!(r < self.rows && c < self.cols, "index out of bounds");
        &mut self.data[r * self.cols + c]
    }
}

fn main() {
    let mut m = Matrix::zeros(2, 3);
    m[(0, 0)] = 1.0;
    m[(0, 1)] = 2.0;
    m[(1, 2)] = 9.0;

    for r in 0..m.rows {
        for c in 0..m.cols {
            print!("{:>4} ", m[(r, c)]);
        }
        println!();
    }

    assert_eq!(m[(1, 2)], 9.0);
}
