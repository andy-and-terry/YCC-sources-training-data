use std::collections::VecDeque;

fn bfs(adj: &[Vec<usize>], start: usize) -> Vec<usize> {
    let mut visited = vec![false; adj.len()];
    let mut order = Vec::new();
    let mut queue = VecDeque::new();

    visited[start] = true;
    queue.push_back(start);
    while let Some(node) = queue.pop_front() {
        order.push(node);
        for &next in &adj[node] {
            if !visited[next] {
                visited[next] = true;
                queue.push_back(next);
            }
        }
    }
    order
}

fn dfs(adj: &[Vec<usize>], start: usize) -> Vec<usize> {
    let mut visited = vec![false; adj.len()];
    let mut order = Vec::new();
    dfs_visit(adj, start, &mut visited, &mut order);
    order
}

fn dfs_visit(adj: &[Vec<usize>], node: usize, visited: &mut [bool], order: &mut Vec<usize>) {
    visited[node] = true;
    order.push(node);
    for &next in &adj[node] {
        if !visited[next] {
            dfs_visit(adj, next, visited, order);
        }
    }
}

fn main() {
    let adj = vec![
        vec![1, 2],
        vec![0, 3, 4],
        vec![0, 4],
        vec![1, 5],
        vec![1, 2, 5],
        vec![3, 4],
    ];
    println!("BFS from 0: {:?}", bfs(&adj, 0));
    println!("DFS from 0: {:?}", dfs(&adj, 0));
}
