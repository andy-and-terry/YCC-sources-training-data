fn product_except_self(nums: &[i64]) -> Vec<i64> {
    let mut out = vec![1; nums.len()];
    let mut prefix = 1;
    for (o, &x) in out.iter_mut().zip(nums) {
        *o = prefix;
        prefix *= x;
    }
    let mut suffix = 1;
    for (o, &x) in out.iter_mut().zip(nums).rev() {
        *o *= suffix;
        suffix *= x;
    }
    out
}

fn main() {
    println!("{:?} {:?}", product_except_self(&[1, 2, 3, 4]), product_except_self(&[-1, 1, 0, -3, 3]));
}
