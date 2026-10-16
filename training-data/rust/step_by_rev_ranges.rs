fn main() {
    let evens: Vec<u32> = (0..=10).step_by(2).collect();
    println!("{:?}", evens);

    let countdown: Vec<u32> = (1..=5).rev().collect();
    println!("{:?}", countdown);

    let down_by_3: Vec<i32> = (0..=12).rev().step_by(3).collect();
    println!("{:?}", down_by_3);

    let r = 3..8;
    println!("len={} contains(5)={} contains(8)={}", r.len(), r.contains(&5), r.contains(&8));

    let letters: String = ('a'..='e').collect();
    println!("{}", letters);
}
