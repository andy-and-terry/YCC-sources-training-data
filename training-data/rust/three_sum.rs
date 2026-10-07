use std::cmp::Ordering;

fn three_sum(nums: &[i32], target: i32) -> Vec<[i32; 3]> {
    let mut a = nums.to_vec();
    a.sort_unstable();
    let mut res = Vec::new();
    for i in 0..a.len().saturating_sub(2) {
        if i > 0 && a[i] == a[i - 1] {
            continue;
        }
        let (mut lo, mut hi) = (i + 1, a.len() - 1);
        while lo < hi {
            match (a[i] + a[lo] + a[hi]).cmp(&target) {
                Ordering::Less => lo += 1,
                Ordering::Greater => hi -= 1,
                Ordering::Equal => {
                    res.push([a[i], a[lo], a[hi]]);
                    while lo < hi && a[lo] == a[lo + 1] {
                        lo += 1;
                    }
                    while lo < hi && a[hi] == a[hi - 1] {
                        hi -= 1;
                    }
                    lo += 1;
                    hi -= 1;
                }
            }
        }
    }
    res
}

fn main() {
    println!("{:?}", three_sum(&[-1, 0, 1, 2, -1, -4], 0));
    println!("{:?}", three_sum(&[1, 2, 3, 4, 5, 6], 10));
}
