use std::ops::Mul;

#[derive(Debug, Clone, Copy, PartialEq)]
struct Matrix<const R: usize, const C: usize> {
    data: [[i32; C]; R],
}

impl<const R: usize, const C: usize> Matrix<R, C> {
    fn zero() -> Self {
        Matrix { data: [[0; C]; R] }
    }

    fn transpose(&self) -> Matrix<C, R> {
        let mut out = Matrix::<C, R>::zero();
        for i in 0..R {
            for j in 0..C {
                out.data[j][i] = self.data[i][j];
            }
        }
        out
    }
}

impl<const R: usize, const K: usize, const C: usize> Mul<Matrix<K, C>> for Matrix<R, K> {
    type Output = Matrix<R, C>;

    fn mul(self, rhs: Matrix<K, C>) -> Matrix<R, C> {
        let mut out = Matrix::<R, C>::zero();
        for i in 0..R {
            for j in 0..C {
                for k in 0..K {
                    out.data[i][j] += self.data[i][k] * rhs.data[k][j];
                }
            }
        }
        out
    }
}

fn sum_array<const N: usize>(arr: [i32; N]) -> i32 {
    arr.iter().sum()
}

fn main() {
    let a = Matrix::<2, 3> { data: [[1, 2, 3], [4, 5, 6]] };
    let b = a.transpose();
    println!("{:?}", b);
    println!("{:?}", a * b);
    println!("{}", sum_array([1, 2, 3, 4]));
}
