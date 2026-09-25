fn minutes_to_rot(grid: &[Vec<u8>]) -> Option<u32> {
    let mut g = grid.to_vec();
    let mut frontier: Vec<(usize, usize)> = Vec::new();
    let mut fresh = 0;
    for (r, row) in g.iter().enumerate() {
        for (c, &v) in row.iter().enumerate() {
            match v {
                2 => frontier.push((r, c)),
                1 => fresh += 1,
                _ => {}
            }
        }
    }
    let mut minutes = 0;
    while !frontier.is_empty() && fresh > 0 {
        let mut next = Vec::new();
        for (r, c) in frontier {
            for (nr, nc) in [(r.wrapping_sub(1), c), (r + 1, c), (r, c.wrapping_sub(1)), (r, c + 1)] {
                if let Some(cell) = g.get_mut(nr).and_then(|row| row.get_mut(nc)).filter(|v| **v == 1) {
                    *cell = 2;
                    fresh -= 1;
                    next.push((nr, nc));
                }
            }
        }
        frontier = next;
        minutes += 1;
    }
    (fresh == 0).then_some(minutes)
}

fn main() {
    println!("{:?} {:?}", minutes_to_rot(&[vec![2, 1, 1], vec![1, 1, 0], vec![0, 1, 1]]), minutes_to_rot(&[vec![2, 1, 1], vec![0, 1, 1], vec![1, 0, 1]]));
}
