fn solve(maze: &[Vec<u8>]) -> Vec<String> {
    fn dfs(maze: &[Vec<u8>], r: usize, c: usize, seen: &mut Vec<Vec<bool>>, path: &mut String, out: &mut Vec<String>) {
        let n = maze.len();
        if (r, c) == (n - 1, n - 1) {
            out.push(path.clone());
            return;
        }
        seen[r][c] = true;
        let moves = [('D', 1i32, 0i32), ('L', 0, -1), ('R', 0, 1), ('U', -1, 0)];
        for (name, dr, dc) in moves {
            let (nr, nc) = (r as i32 + dr, c as i32 + dc);
            if nr < 0 || nc < 0 || nr >= n as i32 || nc >= n as i32 {
                continue;
            }
            let (nr, nc) = (nr as usize, nc as usize);
            if maze[nr][nc] == 1 && !seen[nr][nc] {
                path.push(name);
                dfs(maze, nr, nc, seen, path, out);
                path.pop();
            }
        }
        seen[r][c] = false;
    }
    let mut out = Vec::new();
    if maze[0][0] == 1 {
        let mut seen = vec![vec![false; maze.len()]; maze.len()];
        dfs(maze, 0, 0, &mut seen, &mut String::new(), &mut out);
    }
    out
}

fn main() {
    println!("{:?}", solve(&[vec![1, 0, 0, 0], vec![1, 1, 0, 1], vec![1, 1, 0, 0], vec![0, 1, 1, 1]]));
}
