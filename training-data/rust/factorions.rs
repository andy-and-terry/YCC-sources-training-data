fn main() {
    let fact = [1u32, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];
    let v: Vec<u32> = (1..50000u32)
        .filter(|n| n.to_string().chars().map(|c| fact[c.to_digit(10).unwrap() as usize]).sum::<u32>() == *n)
        .collect();
    println!("{:?}", v); // [1, 2, 145, 40585]
}
