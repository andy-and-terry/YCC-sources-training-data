fn saddle_points(m: &[Vec<i32>]) -> Vec<(usize, usize)> {
    if m.is_empty() {
        return vec![];
    }
    let col_min: Vec<i32> = (0..m[0].len()).map(|c| m.iter().map(|r| r[c]).min().unwrap()).collect();
    let mut out = vec![];
    for (r, row) in m.iter().enumerate() {
        let row_max = *row.iter().max().unwrap();
        for (c, &v) in row.iter().enumerate() {
            if v == row_max && v == col_min[c] {
                out.push((r, c));
            }
        }
    }
    out
}

fn main() {
    println!("{:?}", saddle_points(&[vec![9, 8, 7], vec![5, 3, 2], vec![6, 6, 7]]));
}
