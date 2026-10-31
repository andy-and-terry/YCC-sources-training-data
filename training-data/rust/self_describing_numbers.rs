fn is_self_describing(n: u64) -> bool {
    let digits: Vec<usize> = n.to_string().bytes().map(|b| (b - b'0') as usize).collect();
    digits
        .iter()
        .enumerate()
        .all(|(i, &d)| digits.iter().filter(|&&x| x == i).count() == d)
}

fn main() {
    for n in [1210, 2020, 21200, 1211] {
        println!("{} {}", n, is_self_describing(n));
    }
}
