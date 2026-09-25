use std::collections::VecDeque;

fn knight_distances(n: usize, start: (usize, usize)) -> Vec<Vec<Option<u32>>> {
    const MOVES: [(i32, i32); 8] = [(1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1), (-2, 1), (-1, 2)];
    let mut dist = vec![vec![None; n]; n];
    dist[start.0][start.1] = Some(0);
    let mut q = VecDeque::from([start]);
    while let Some((x, y)) = q.pop_front() {
        let d = dist[x][y].unwrap();
        for (dx, dy) in MOVES {
            let (nx, ny) = (x as i32 + dx, y as i32 + dy);
            if nx < 0 || ny < 0 || nx >= n as i32 || ny >= n as i32 {
                continue;
            }
            let (nx, ny) = (nx as usize, ny as usize);
            if dist[nx][ny].is_none() {
                dist[nx][ny] = Some(d + 1);
                q.push_back((nx, ny));
            }
        }
    }
    dist
}

fn main() {
    let d = knight_distances(8, (0, 0));
    for y in (0..8).rev() {
        println!("{}", (0..8).map(|x| d[x][y].unwrap().to_string()).collect::<Vec<_>>().join(" "));
    }
    println!("unreachable on 2x2: {:?}", knight_distances(2, (0, 0))[1][1]);
}
