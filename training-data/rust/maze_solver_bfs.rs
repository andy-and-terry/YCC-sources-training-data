use std::collections::{HashSet, VecDeque};

fn solve_maze(maze: &[Vec<i32>], start: (i32, i32), end: (i32, i32)) -> Option<Vec<(i32, i32)>> {
    let rows = maze.len() as i32;
    let cols = maze[0].len() as i32;
    let mut queue = VecDeque::new();
    queue.push_back((start, vec![start]));
    let mut visited = HashSet::new();
    visited.insert(start);
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)];

    while let Some((pos, path)) = queue.pop_front() {
        if pos == end {
            return Some(path);
        }
        for &(dr, dc) in &directions {
            let next = (pos.0 + dr, pos.1 + dc);
            if next.0 >= 0 && next.0 < rows && next.1 >= 0 && next.1 < cols
                && maze[next.0 as usize][next.1 as usize] == 0
                && !visited.contains(&next)
            {
                visited.insert(next);
                let mut new_path = path.clone();
                new_path.push(next);
                queue.push_back((next, new_path));
            }
        }
    }
    None
}

fn main() {
    let maze = vec![
        vec![0, 1, 0, 0],
        vec![0, 1, 0, 1],
        vec![0, 0, 0, 1],
        vec![1, 1, 0, 0],
    ];
    println!("{:?}", solve_maze(&maze, (0, 0), (3, 3)));
}
