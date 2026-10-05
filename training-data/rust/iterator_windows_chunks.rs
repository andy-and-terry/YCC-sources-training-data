fn main() {
    let data = [1, 4, 2, 8, 5, 7];

    let diffs: Vec<i32> = data.windows(2).map(|w| w[1] - w[0]).collect();
    println!("{:?}", diffs);

    let sums: Vec<i32> = data.chunks(4).map(|c| c.iter().sum()).collect();
    println!("{:?}", sums);

    let moving_avg: Vec<f64> = data
        .windows(3)
        .map(|w| w.iter().sum::<i32>() as f64 / 3.0)
        .collect();
    println!("{:?}", moving_avg);

    let (evens, odds): (Vec<i32>, Vec<i32>) = data.iter().partition(|&&x| x % 2 == 0);
    println!("{:?} {:?}", evens, odds);

    println!("{:?}", data.iter().rev().skip_while(|&&x| x > 4).collect::<Vec<_>>());
    println!("{:?}", data.iter().position(|&x| x == 8));
    println!("{:?}", data.iter().zip(data.iter().skip(1)).filter(|(a, b)| a < b).count());
    let (mn, mx) = data.iter().fold((i32::MAX, i32::MIN), |(lo, hi), &x| (lo.min(x), hi.max(x)));
    println!("{} {}", mn, mx);
}
