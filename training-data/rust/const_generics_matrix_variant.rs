struct Matrix<const R: usize, const C: usize>([[i32; C]; R]);

impl<const R: usize, const C: usize> Matrix<R, C> {
    fn transpose(&self) -> Matrix<C, R> {
        let mut out = [[0; R]; C];
        for i in 0..R { for j in 0..C { out[j][i] = self.0[i][j]; } }
        Matrix(out)
    }
}

fn main() {
    let m = Matrix([[1, 2, 3], [4, 5, 6]]);
    println!("{:?}", m.transpose().0);
}
