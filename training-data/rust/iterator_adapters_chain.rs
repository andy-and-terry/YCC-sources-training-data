fn main() {
    let v: Vec<i32> = (1..=10).collect();
    let r: Vec<i32> = v.iter().filter(|&&x| x % 2 == 0).map(|x| x * x).skip(1).take(3).collect();
    println!("{:?}", r);
    let (even, odd): (Vec<i32>, Vec<i32>) = v.iter().partition(|&&x| x % 2 == 0);
    println!("{:?} {:?}", even, odd);
    println!("{:?}", v.iter().rev().step_by(3).collect::<Vec<_>>());
}
