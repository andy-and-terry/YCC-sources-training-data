use std::cmp::Ordering;

#[derive(Debug, Clone)]
struct Player {
    name: &'static str,
    score: u32,
    time: f64,
}

fn main() {
    let mut players = vec![
        Player { name: "cy", score: 90, time: 12.5 },
        Player { name: "ann", score: 95, time: 14.0 },
        Player { name: "bo", score: 90, time: 11.2 },
        Player { name: "di", score: 70, time: 9.9 },
    ];

    // score descending, then time ascending (floats need partial_cmp)
    players.sort_by(|a, b| {
        b.score
            .cmp(&a.score)
            .then_with(|| a.time.partial_cmp(&b.time).unwrap_or(Ordering::Equal))
    });
    for p in &players {
        println!("{:<4}{:>3}{:>6.1}", p.name, p.score, p.time);
    }

    players.sort_by_key(|p| p.name.len());
    println!("{:?}", players.iter().map(|p| p.name).collect::<Vec<_>>());

    players.sort_by(|a, b| a.time.total_cmp(&b.time));
    println!("fastest: {}", players[0].name);

    let sorted = [1, 3, 5, 7, 9];
    println!("{:?} {:?}", sorted.binary_search(&7), sorted.binary_search(&4));
    println!("{:?}", sorted.partition_point(|&x| x < 6));
    println!("{:?}", 3.cmp(&5));
    println!("{:?}", "apple".cmp("apricot"));
    println!("{:?}", [1, 2, 3].iter().max_by_key(|&&x| (x as i32 - 2).abs()));
}
