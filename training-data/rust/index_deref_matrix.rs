// Implementing std::ops::Index/IndexMut lets a custom type use m[(r,
// c)] syntax directly; Deref/DerefMut to the backing slice gets the
// full slice API (iter, len, chunks, ...) for free -- no cloning, no
// wrapper methods reimplementing what the standard library already
// provides.

use std::ops::{Deref, DerefMut, Index, IndexMut};

struct Matrix {
    data: Vec<f64>,
    cols: usize,
}

impl Matrix {
    fn new(rows: usize, cols: usize) -> Self {
        Matrix { data: vec![0.0; rows * cols], cols }
    }
}

impl Index<(usize, usize)> for Matrix {
    type Output = f64;
    fn index(&self, (row, col): (usize, usize)) -> &f64 {
        &self.data[row * self.cols + col]
    }
}

impl IndexMut<(usize, usize)> for Matrix {
    fn index_mut(&mut self, (row, col): (usize, usize)) -> &mut f64 {
        &mut self.data[row * self.cols + col]
    }
}

impl Deref for Matrix {
    type Target = [f64];
    fn deref(&self) -> &[f64] {
        &self.data
    }
}

impl DerefMut for Matrix {
    fn deref_mut(&mut self) -> &mut [f64] {
        &mut self.data
    }
}

fn main() {
    let mut m = Matrix::new(2, 3);
    m[(0, 0)] = 1.0;
    m[(0, 1)] = 2.0;
    m[(1, 2)] = 9.0;

    println!("{}", m[(1, 2)]);

    // These come from Deref<Target = [f64]>, not anything Matrix defines.
    println!("len via deref: {}", m.len());
    println!("sum via deref: {}", m.iter().sum::<f64>());

    for value in m.iter_mut() {
        *value += 1.0;
    }
    println!("after +1: {:?}", &*m);
}
