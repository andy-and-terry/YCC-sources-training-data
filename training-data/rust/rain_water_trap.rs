/// Prefix/suffix max via iterator scans.
fn trap(h: &[u32]) -> u32 {
    let left: Vec<u32> = h.iter().scan(0, |m, &x| { *m = (*m).max(x); Some(*m) }).collect();
    let mut right: Vec<u32> = h.iter().rev().scan(0, |m, &x| { *m = (*m).max(x); Some(*m) }).collect();
    right.reverse();
    h.iter().zip(left.iter().zip(&right)).map(|(&x, (&l, &r))| l.min(r) - x).sum()
}

fn main() {
    println!("{} {}", trap(&[0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), trap(&[4, 2, 0, 3, 2, 5]));
}
