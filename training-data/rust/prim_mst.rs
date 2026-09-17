use std::cmp::Ordering;
use std::collections::BinaryHeap;

struct Edge {
    cost: i32,
    to: usize,
    from: usize,
}

impl Eq for Edge {}
impl PartialEq for Edge {
    fn eq(&self, other: &Self) -> bool {
        self.cost == other.cost
    }
}
impl Ord for Edge {
    fn cmp(&self, other: &Self) -> Ordering {
        other.cost.cmp(&self.cost)
    }
}
impl PartialOrd for Edge {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

fn prim_mst(num_nodes: usize, adj: &[Vec<(usize, i32)>], start: usize) -> (Vec<(usize, usize, i32)>, i32) {
    let mut visited = vec![false; num_nodes];
    let mut heap = BinaryHeap::new();
    let mut mst = Vec::new();
    let mut total_cost = 0;

    visited[start] = true;
    for &(to, cost) in &adj[start] {
        heap.push(Edge { cost, to, from: start });
    }

    while let Some(Edge { cost, to, from }) = heap.pop() {
        if visited[to] {
            continue;
        }
        visited[to] = true;
        total_cost += cost;
        mst.push((from, to, cost));
        for &(next, next_cost) in &adj[to] {
            if !visited[next] {
                heap.push(Edge { cost: next_cost, to: next, from: to });
            }
        }
    }
    (mst, total_cost)
}

fn main() {
    // undirected graph as a symmetric adjacency list
    let adj = vec![
        vec![(1, 2), (3, 6)],
        vec![(0, 2), (2, 3), (3, 8), (4, 5)],
        vec![(1, 3), (4, 7)],
        vec![(0, 6), (1, 8), (4, 9)],
        vec![(1, 5), (2, 7), (3, 9)],
    ];
    let (mst, cost) = prim_mst(5, &adj, 0);
    println!("MST edges: {:?}", mst);
    println!("total cost: {}", cost);
}
