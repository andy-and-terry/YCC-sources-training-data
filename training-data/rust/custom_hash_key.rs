use std::collections::{HashMap, HashSet};

#[derive(Debug, PartialEq, Eq, Hash, Clone, Copy)]
struct Coord {
    x: i32,
    y: i32,
}

#[derive(Debug, PartialEq, Eq, Hash)]
enum Kind {
    Wall,
    Floor,
}

fn main() {
    let mut grid: HashMap<Coord, Kind> = HashMap::new();
    grid.insert(Coord { x: 0, y: 0 }, Kind::Floor);
    grid.insert(Coord { x: 1, y: 0 }, Kind::Wall);
    println!("{:?}", grid.get(&Coord { x: 1, y: 0 }));
    println!("{:?}", grid.get(&Coord { x: 5, y: 5 }));

    let mut seen = HashSet::new();
    for c in [Coord { x: 1, y: 1 }, Coord { x: 1, y: 1 }, Coord { x: 2, y: 1 }] {
        if !seen.insert(c) {
            println!("duplicate {:?}", c);
        }
    }
    println!("unique = {}", seen.len());
}
