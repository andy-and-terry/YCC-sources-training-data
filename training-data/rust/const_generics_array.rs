use std::fmt::Debug;

// Const generics let types and functions abstract over array lengths.
#[derive(Debug)]
struct Matrix<const R: usize, const C: usize> {
    data: [[i32; C]; R],
}

impl<const R: usize, const C: usize> Matrix<R, C> {
    fn transpose(&self) -> Matrix<C, R> {
        let mut data = [[0; R]; C];
        for r in 0..R {
            for c in 0..C {
                data[c][r] = self.data[r][c];
            }
        }
        Matrix { data }
    }
}

fn sum_all<const N: usize>(xs: [i32; N]) -> i32 {
    xs.iter().sum()
}

fn first_and_last<T: Copy + Debug, const N: usize>(xs: &[T; N]) -> Option<(T, T)> {
    if N == 0 { None } else { Some((xs[0], xs[N - 1])) }
}

fn main() {
    let m = Matrix { data: [[1, 2, 3], [4, 5, 6]] };
    println!("{:?}", m.transpose());
    println!("{}", sum_all([1, 2, 3, 4]));
    println!("{}", sum_all([]));
    println!("{:?}", first_and_last(&['a', 'b', 'c']));
    println!("{:?}", first_and_last::<u8, 0>(&[]));
    let arr: [u8; 4] = std::array::from_fn(|i| (i * i) as u8);
    println!("{:?}", arr);
}
