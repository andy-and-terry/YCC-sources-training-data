use std::ops::RangeInclusive;

fn grade(score: u32) -> &'static str {
    match score {
        90..=100 => "A",
        80..=89 => "B",
        0..=79 => "C",
        _ => "invalid",
    }
}

fn main() {
    let valid: RangeInclusive<i32> = 1..=10;
    println!("{} {}", valid.contains(&10), valid.contains(&11));
    println!("{} {}", (0..10).contains(&10), (0.0..1.0).contains(&0.5));
    println!("{:?} {:?}", valid.start(), valid.end());

    println!("{} {} {}", 15.clamp(0, 10), (-3).clamp(0, 10), 5.clamp(0, 10));
    println!("{}", 2.7_f64.clamp(0.0, 1.0));

    for s in [95, 85, 40, 101] {
        println!("{} -> {}", s, grade(s));
    }
    println!("{}", (1..=5).rev().map(|n| n.to_string()).collect::<Vec<_>>().join(","));
    println!("{}", (1..=0).is_empty());
}
