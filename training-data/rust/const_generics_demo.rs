// Const generics let a type or function be parameterized over a
// compile-time constant (here, an array length) instead of only over
// types, so the size becomes part of the type and is checked statically.
struct Matrix<const ROWS: usize, const COLS: usize> {
    data: [[f64; COLS]; ROWS],
}

impl<const ROWS: usize, const COLS: usize> Matrix<ROWS, COLS> {
    fn zero() -> Self {
        Matrix {
            data: [[0.0; COLS]; ROWS],
        }
    }

    fn set(&mut self, row: usize, col: usize, value: f64) {
        self.data[row][col] = value;
    }

    fn sum(&self) -> f64 {
        self.data.iter().flat_map(|row| row.iter()).sum()
    }
}

fn sum_array<const N: usize>(items: [i32; N]) -> i32 {
    items.iter().sum()
}

fn main() {
    let mut m: Matrix<2, 3> = Matrix::zero();
    m.set(0, 0, 1.5);
    m.set(1, 2, 2.5);
    println!("matrix sum: {}", m.sum());

    println!("sum of 3: {}", sum_array([1, 2, 3]));
    println!("sum of 5: {}", sum_array([1, 2, 3, 4, 5]));
}
