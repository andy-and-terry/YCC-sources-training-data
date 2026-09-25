fn partition(nums: &[usize]) -> Option<(Vec<usize>, Vec<usize>)> {
    let total: usize = nums.iter().sum();
    if total % 2 == 1 {
        return None;
    }
    let target = total / 2;
    // reach[s] = index of the item that first made sum s reachable
    let mut reach: Vec<Option<usize>> = vec![None; target + 1];
    let mut reachable = vec![false; target + 1];
    reachable[0] = true;
    for (i, &x) in nums.iter().enumerate() {
        for s in (x..=target).rev() {
            if !reachable[s] && reachable[s - x] {
                reachable[s] = true;
                reach[s] = Some(i);
            }
        }
    }
    if !reachable[target] {
        return None;
    }
    let mut used = vec![false; nums.len()];
    let mut s = target;
    while s > 0 {
        let i = reach[s].unwrap();
        used[i] = true;
        s -= nums[i];
    }
    let (a, b): (Vec<_>, Vec<_>) = nums.iter().enumerate().partition(|(i, _)| used[*i]);
    Some((a.into_iter().map(|(_, &v)| v).collect(), b.into_iter().map(|(_, &v)| v).collect()))
}

fn main() {
    println!("{:?}", partition(&[1, 5, 11, 5]));
    println!("{:?}", partition(&[1, 2, 3, 5]));
    println!("{:?}", partition(&[3, 1, 1, 2, 2, 1]));
}
