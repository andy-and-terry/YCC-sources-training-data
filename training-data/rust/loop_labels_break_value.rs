fn main() {
    let mut found = None;
    'outer: for i in 1..10 {
        for j in 1..10 {
            if i * j == 42 { found = Some((i, j)); break 'outer; }
            if j > i { continue 'outer; }
        }
    }
    println!("{:?}", found);
}
