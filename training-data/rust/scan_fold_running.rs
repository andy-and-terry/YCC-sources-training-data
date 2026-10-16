fn main() {
    let xs = [3, 1, 4, 1, 5, 9, 2, 6];

    let running: Vec<i32> = xs
        .iter()
        .scan(0, |acc, &x| {
            *acc += x;
            Some(*acc)
        })
        .collect();
    println!("running sum: {:?}", running);

    let (mn, mx) = xs.iter().fold((i32::MAX, i32::MIN), |(lo, hi), &x| (lo.min(x), hi.max(x)));
    println!("min={} max={}", mn, mx);

    let joined = xs.iter().fold(String::new(), |mut s, x| {
        if !s.is_empty() {
            s.push('-');
        }
        s += &x.to_string();
        s
    });
    println!("{}", joined);
}
