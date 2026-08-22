fn transpose(matrix: &[Vec<i32>]) -> Vec<Vec<i32>> {
    let rows = matrix.len();
    let cols = matrix[0].len();
    let mut result = vec![vec![0; rows]; cols];
    for i in 0..rows {
        for j in 0..cols {
            result[j][i] = matrix[i][j];
        }
    }
    result
}

fn main() {
    let m = vec![vec![1, 2, 3], vec![4, 5, 6]];
    println!("{:?}", transpose(&m));
}
