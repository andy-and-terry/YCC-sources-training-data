fn bell(n: usize) -> u64 {
    let mut row = vec![1u64];
    for _ in 0..n {
        let mut next = vec![*row.last().unwrap()];
        for &x in &row {
            let last = *next.last().unwrap();
            next.push(last + x);
        }
        row = next;
    }
    row[0]
}

fn main() {
    let v: Vec<u64> = (0..10).map(bell).collect();
    println!("{:?}", v);
    assert_eq!(bell(5), 52);
}
