fn kaprekar_steps(mut n: u32) -> u32 {
    let mut steps = 0;
    while n != 6174 {
        let mut d: Vec<u32> = format!("{:04}", n).chars().map(|c| c.to_digit(10).unwrap()).collect();
        d.sort();
        let asc = d.iter().fold(0, |a, &x| a * 10 + x);
        let desc = d.iter().rev().fold(0, |a, &x| a * 10 + x);
        n = desc - asc;
        steps += 1;
    }
    steps
}

fn main() {
    println!("{}", kaprekar_steps(3524));
}
