fn rotate_cw<T: Clone>(m: &[Vec<T>]) -> Vec<Vec<T>> {
    let rows = m.len();
    (0..m[0].len()).map(|c| (0..rows).rev().map(|r| m[r][c].clone()).collect()).collect()
}

fn rotate_in_place(m: &mut [Vec<i32>]) {
    let n = m.len();
    for i in 0..n {
        for j in i + 1..n {
            let t = m[i][j];
            m[i][j] = m[j][i];
            m[j][i] = t;
        }
    }
    for row in m.iter_mut() {
        row.reverse();
    }
}

fn main() {
    let rect = vec![vec![1, 2, 3, 4], vec![5, 6, 7, 8]];
    for row in rotate_cw(&rect) {
        println!("{:?}", row);
    }
    let mut sq = vec![vec![1, 2, 3], vec![4, 5, 6], vec![7, 8, 9]];
    rotate_in_place(&mut sq);
    println!("{:?}", sq);
}
