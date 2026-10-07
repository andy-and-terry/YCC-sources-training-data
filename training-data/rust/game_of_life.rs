use std::collections::{HashMap, HashSet};

type Cell = (i32, i32);

fn step(live: &HashSet<Cell>) -> HashSet<Cell> {
    let mut counts: HashMap<Cell, u8> = HashMap::new();
    for &(x, y) in live {
        for dx in -1..=1 {
            for dy in -1..=1 {
                if dx != 0 || dy != 0 {
                    *counts.entry((x + dx, y + dy)).or_default() += 1;
                }
            }
        }
    }
    counts.into_iter().filter(|(c, n)| *n == 3 || (*n == 2 && live.contains(c))).map(|(c, _)| c).collect()
}

fn render(live: &HashSet<Cell>, w: i32, h: i32) -> String {
    (0..h).map(|y| (0..w).map(|x| if live.contains(&(x, y)) { '#' } else { '.' }).collect::<String>()).collect::<Vec<_>>().join("\n")
}

fn main() {
    let mut world: HashSet<Cell> = [(1, 0), (2, 1), (0, 2), (1, 2), (2, 2)].into_iter().collect();
    for gen in 0..4 {
        println!("gen {}\n{}\n", gen, render(&world, 6, 6));
        world = step(&world);
    }
}
