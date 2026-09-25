fn set_zeroes(m: &mut [Vec<i32>]) {
    let zero_rows: Vec<bool> = m.iter().map(|r| r.contains(&0)).collect();
    let zero_cols: Vec<bool> = (0..m[0].len()).map(|c| m.iter().any(|r| r[c] == 0)).collect();
    for (r, row) in m.iter_mut().enumerate() {
        for (c, v) in row.iter_mut().enumerate() {
            if zero_rows[r] || zero_cols[c] {
                *v = 0;
            }
        }
    }
}

fn main() {
    let mut m = vec![vec![0, 1, 2, 0], vec![3, 4, 5, 2], vec![1, 3, 1, 5]];
    set_zeroes(&mut m);
    for row in &m {
        println!("{:?}", row);
    }
}
