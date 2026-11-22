// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
fn main() {
    let mut row: Vec<u64> = vec![1];
    let mut out = vec![1u64];
    for _ in 0..9 {
        let mut next = vec![0u64];
        for &x in row.iter().rev() {
            let last = *next.last().unwrap();
            next.push(last + x);
        }
        row = next;
        out.push(*row.last().unwrap());
    }
    let s: Vec<String> = out.iter().map(|x| x.to_string()).collect();
    println!("{}", s.join(" "));
}
