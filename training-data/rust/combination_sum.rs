fn combination_sum(candidates: &[u32], target: u32) -> Vec<Vec<u32>> {
    let mut c = candidates.to_vec();
    c.sort_unstable();
    c.dedup();
    let mut out = Vec::new();
    let mut path = Vec::new();
    fn backtrack(c: &[u32], start: usize, remaining: u32, path: &mut Vec<u32>, out: &mut Vec<Vec<u32>>) {
        if remaining == 0 {
            out.push(path.clone());
            return;
        }
        for i in start..c.len() {
            if c[i] > remaining {
                break;
            }
            path.push(c[i]);
            backtrack(c, i, remaining - c[i], path, out);
            path.pop();
        }
    }
    backtrack(&c, 0, target, &mut path, &mut out);
    out
}

fn main() {
    println!("{:?}", combination_sum(&[2, 3, 6, 7], 7));
    println!("{:?}", combination_sum(&[2, 3, 5], 8));
}
