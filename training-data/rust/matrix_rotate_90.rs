fn rotate_clockwise<T: Copy>(m: &mut Vec<Vec<T>>) {
    let n = m.len();
    for i in 0..n {
        for j in i + 1..n {
            let tmp = m[i][j];
            m[i][j] = m[j][i];
            m[j][i] = tmp;
        }
    }
    m.iter_mut().for_each(|row| row.reverse());
}

fn main() {
    let mut m = vec![vec![1, 2, 3], vec![4, 5, 6], vec![7, 8, 9]];
    rotate_clockwise(&mut m);
    println!("{:?}", m);
}
