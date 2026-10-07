use std::cmp::Reverse;
use std::collections::BinaryHeap;

/// Dijkstra over a grid with four-directional moves.
fn min_path(grid: &[Vec<u32>]) -> u32 {
    let (rows, cols) = (grid.len(), grid[0].len());
    let mut dist = vec![vec![u32::MAX; cols]; rows];
    let mut pq = BinaryHeap::new();
    dist[0][0] = grid[0][0];
    pq.push(Reverse((grid[0][0], 0usize, 0usize)));
    while let Some(Reverse((d, r, c))) = pq.pop() {
        if d > dist[r][c] {
            continue;
        }
        let nbrs = [(r.wrapping_sub(1), c), (r + 1, c), (r, c.wrapping_sub(1)), (r, c + 1)];
        for (nr, nc) in nbrs {
            if nr < rows && nc < cols && d + grid[nr][nc] < dist[nr][nc] {
                dist[nr][nc] = d + grid[nr][nc];
                pq.push(Reverse((dist[nr][nc], nr, nc)));
            }
        }
    }
    dist[rows - 1][cols - 1]
}

fn main() {
    println!("{}", min_path(&[vec![1, 3, 1], vec![1, 5, 1], vec![4, 2, 1]]));
    println!("{}", min_path(&[vec![1, 9, 1, 1, 1], vec![1, 9, 1, 9, 1], vec![1, 1, 1, 9, 1]]));
}
