use std::cmp::Ordering;

#[derive(Debug, Clone)]
struct Player {
    name: &'static str,
    score: u32,
    time: u32,
}

fn main() {
    let mut ps = vec![
        Player { name: "zed", score: 90, time: 40 },
        Player { name: "amy", score: 90, time: 35 },
        Player { name: "bob", score: 75, time: 20 },
        Player { name: "cat", score: 90, time: 35 },
    ];
    ps.sort_by(|a, b| {
        b.score
            .cmp(&a.score)
            .then_with(|| a.time.cmp(&b.time))
            .then(a.name.cmp(b.name))
    });
    for p in &ps {
        println!("{:?}", p);
    }
    println!("{:?}", 3.cmp(&5));
    println!("{:?}", "abc".cmp("abd").reverse());
    println!("{}", matches!(1.cmp(&1), Ordering::Equal));
    println!("{:?}", 5.clamp(1, 3));
}
