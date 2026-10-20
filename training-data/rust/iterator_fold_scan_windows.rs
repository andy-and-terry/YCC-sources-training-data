fn main() {
    let v = [3, 1, 4, 1, 5, 9];
    let running: Vec<i32> = v.iter().scan(0, |acc, &x| { *acc += x; Some(*acc) }).collect();
    println!("{:?}", running);
    let maxes: Vec<i32> = v.windows(3).map(|w| *w.iter().max().unwrap()).collect();
    println!("{:?}", maxes);
    println!("{}", v.iter().fold(String::new(), |s, x| s + &x.to_string()));
}
