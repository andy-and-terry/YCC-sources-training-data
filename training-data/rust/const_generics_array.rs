#[derive(Debug)]
struct Matrix<const R: usize, const C: usize> {
    data: [[i32; C]; R],
}

impl<const R: usize, const C: usize> Matrix<R, C> {
    fn transpose(&self) -> Matrix<C, R> {
        let mut data = [[0; R]; C];
        for i in 0..R {
            for j in 0..C {
                data[j][i] = self.data[i][j];
            }
        }
        Matrix { data }
    }
}

fn sum_all<const N: usize>(arr: [i32; N]) -> i32 {
    arr.iter().sum()
}

fn main() {
    let m = Matrix { data: [[1, 2, 3], [4, 5, 6]] };
    println!("{:?}", m.transpose());
    println!("{}", sum_all([1, 2, 3, 4]));
    println!("{}", sum_all([10; 7]));
}
