fn pascals_triangle(rows: usize) -> Vec<Vec<u64>> {
    let mut triangle: Vec<Vec<u64>> = Vec::with_capacity(rows);
    for i in 0..rows {
        let mut row = vec![1u64; i + 1];
        for j in 1..i {
            row[j] = triangle[i - 1][j - 1] + triangle[i - 1][j];
        }
        triangle.push(row);
    }
    triangle
}

fn main() {
    for row in pascals_triangle(6) {
        println!("{:?}", row);
    }
}
