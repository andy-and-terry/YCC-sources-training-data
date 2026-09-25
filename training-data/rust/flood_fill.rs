use std::collections::VecDeque;

fn flood_fill(grid: &mut [Vec<u8>], start: (usize, usize), color: u8) -> usize {
    let target = grid[start.0][start.1];
    if target == color {
        return 0;
    }
    let mut q = VecDeque::from([start]);
    grid[start.0][start.1] = color;
    let mut filled = 1;
    while let Some((r, c)) = q.pop_front() {
        let neighbours = [(r.wrapping_sub(1), c), (r + 1, c), (r, c.wrapping_sub(1)), (r, c + 1)];
        for (nr, nc) in neighbours {
            if let Some(cell) = grid.get_mut(nr).and_then(|row| row.get_mut(nc)) {
                if *cell == target {
                    *cell = color;
                    filled += 1;
                    q.push_back((nr, nc));
                }
            }
        }
    }
    filled
}

fn main() {
    let mut img: Vec<Vec<u8>> = ["..####..", ".#....#.", ".#....#.", "..####.."].iter().map(|s| s.bytes().collect()).collect();
    println!("filled {}", flood_fill(&mut img, (1, 3), b'o'));
    for row in &img {
        println!("{}", String::from_utf8_lossy(row));
    }
}
