fn main() {
    let v = vec![3, 1, 4, 1, 5, 9, 2, 6];
    println!("{:?}", v.iter().skip_while(|&&x| x < 4).take_while(|&&x| x != 2).collect::<Vec<_>>());
    println!("{:?}", v.iter().enumerate().filter(|(i, _)| i % 3 == 0).map(|(_, x)| x).collect::<Vec<_>>());
    println!("{:?} {:?}", v.iter().max_by_key(|&&x| (x % 5, x)), v.iter().min_by(|a, b| a.cmp(b)));
    println!("{:?}", v.iter().position(|&x| x == 5));
    println!("{} {}", v.iter().any(|&x| x > 8), v.iter().all(|&x| x > 0));
    println!("{:?}", v.chunks(3).map(|c| c.iter().sum::<i32>()).collect::<Vec<_>>());
    println!("{:?}", v.windows(2).filter(|w| w[0] < w[1]).count());
    println!("{:?}", v.iter().rev().step_by(3).collect::<Vec<_>>());
    println!("{:?}", v.iter().copied().reduce(|a, b| a.max(b)));
    println!("{:?}", v.iter().map(|x| x.to_string()).collect::<Vec<_>>().join("-"));
    let (small, big): (Vec<i32>, Vec<i32>) = v.iter().partition(|&&x| x < 4);
    println!("{:?} {:?}", small, big);
    println!("{:?}", std::iter::repeat("ab").take(3).collect::<String>());
    println!("{:?}", v.iter().last());
    println!("{:?}", (1..=4).product::<i32>());
    println!("{:?}", v.iter().cycle().take(10).count());
    println!("{:?}", v.first().zip(v.last()));
}
