fn pascal(rows: usize) -> Vec<Vec<u64>> {
    let mut t: Vec<Vec<u64>> = Vec::with_capacity(rows);
    for r in 0..rows {
        let row = (0..=r)
            .map(|i| if i == 0 || i == r { 1 } else { t[r - 1][i - 1] + t[r - 1][i] })
            .collect();
        t.push(row);
    }
    t
}

fn main() {
    let t = pascal(10);
    for (r, row) in t.iter().enumerate() {
        let line: String = row.iter().map(|v| format!("{:4}", v)).collect();
        println!("{}{}", " ".repeat((t.len() - r - 1) * 2), line);
    }
    let sums_ok = t.iter().enumerate().all(|(r, row)| row.iter().sum::<u64>() == 1 << r);
    println!("row sums are powers of two: {}", sums_ok);
}
