// Prim's algorithm grows a single minimum spanning tree one edge at a
// time, always adding the cheapest edge that crosses the boundary
// between visited and unvisited vertices.
use std::collections::BinaryHeap;
use std::cmp::Reverse;

fn prim_mst(num_nodes: usize, adj: &[Vec<(usize, i32)>]) -> (i32, Vec<(usize, usize, i32)>) {
    let mut visited = vec![false; num_nodes];
    let mut heap = BinaryHeap::new();
    let mut edges = Vec::new();
    let mut total = 0;

    visited[0] = true;
    for &(to, weight) in &adj[0] {
        heap.push(Reverse((weight, 0, to)));
    }

    while let Some(Reverse((weight, from, to))) = heap.pop() {
        if visited[to] {
            continue;
        }
        visited[to] = true;
        total += weight;
        edges.push((from, to, weight));

        for &(next, next_weight) in &adj[to] {
            if !visited[next] {
                heap.push(Reverse((next_weight, to, next)));
            }
        }
    }

    (total, edges)
}

fn main() {
    // undirected graph: 0-1(4), 0-2(1), 1-2(2), 1-3(5), 2-3(8)
    let mut adj = vec![Vec::new(); 4];
    let raw_edges = [(0, 1, 4), (0, 2, 1), (1, 2, 2), (1, 3, 5), (2, 3, 8)];
    for &(u, v, w) in &raw_edges {
        adj[u].push((v, w));
        adj[v].push((u, w));
    }

    let (total_weight, mst_edges) = prim_mst(4, &adj);
    println!("total weight: {}", total_weight);
    println!("edges: {:?}", mst_edges);
}
