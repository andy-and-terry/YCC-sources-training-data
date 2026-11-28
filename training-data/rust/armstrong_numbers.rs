fn is_armstrong(n: u32) -> bool {
    let digits: Vec<u32> = n.to_string().chars().map(|c| c.to_digit(10).unwrap()).collect();
    let len = digits.len() as u32;
    digits.iter().map(|d| d.pow(len)).sum::<u32>() == n
}

fn main() {
    let v: Vec<u32> = (1..1000).filter(|&n| is_armstrong(n)).collect();
    println!("{:?}", v); // [1, ..., 9, 153, 370, 371, 407]
}
