struct Matrix<const R: usize, const C: usize> {
    d: [[i32; C]; R],
}

impl<const R: usize, const C: usize> Matrix<R, C> {
    fn transpose(&self) -> Matrix<C, R> {
        let mut d = [[0; R]; C];
        for i in 0..R { for j in 0..C { d[j][i] = self.d[i][j]; } }
        Matrix { d }
    }
}

fn main() {
    let m = Matrix { d: [[1, 2, 3], [4, 5, 6]] };
    println!("{:?}", m.transpose().d);
}
