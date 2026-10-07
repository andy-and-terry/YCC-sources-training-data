fn can_jump(a: &[usize]) -> bool {
    let mut reach = 0;
    for (i, &x) in a.iter().enumerate() {
        if i > reach {
            return false;
        }
        reach = reach.max(i + x);
    }
    true
}

fn min_jumps(a: &[usize]) -> Option<usize> {
    let (mut jumps, mut end, mut far) = (0, 0, 0);
    for i in 0..a.len().saturating_sub(1) {
        far = far.max(i + a[i]);
        if i == end {
            if far <= i {
                return None;
            }
            jumps += 1;
            end = far;
        }
    }
    Some(jumps)
}

fn main() {
    println!("{} {}", can_jump(&[2, 3, 1, 1, 4]), can_jump(&[3, 2, 1, 0, 4]));
    println!("{:?} {:?}", min_jumps(&[2, 3, 1, 1, 4]), min_jumps(&[3, 2, 1, 0, 4]));
}
