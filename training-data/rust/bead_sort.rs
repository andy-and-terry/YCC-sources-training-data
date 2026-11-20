// Bead (gravity) sort.
fn bead_sort(nums: &[usize]) -> Vec<usize> {
    let max = *nums.iter().max().unwrap();
    let mut cols = vec![0usize; max];
    for &n in nums {
        for c in cols.iter_mut().take(n) {
            *c += 1;
        }
    }
    let mut out: Vec<usize> = (0..nums.len()).map(|r| cols.iter().filter(|&&c| c > r).count()).collect();
    out.reverse();
    out
}

fn main() {
    println!("{:?}", bead_sort(&[5, 3, 1, 4, 2]));
}
