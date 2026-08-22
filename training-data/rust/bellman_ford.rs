fn bellman_ford(num_nodes: usize, edges: &[(usize, usize, i32)], source: usize) -> Vec<i32> {
    let mut dist = vec![i32::MAX; num_nodes];
    dist[source] = 0;

    for _ in 0..num_nodes - 1 {
        for &(u, v, w) in edges {
            if dist[u] != i32::MAX && dist[u] + w < dist[v] {
                dist[v] = dist[u] + w;
            }
        }
    }

    for &(u, v, w) in edges {
        if dist[u] != i32::MAX && dist[u] + w < dist[v] {
            panic!("graph contains a negative-weight cycle");
        }
    }

    dist
}

fn main() {
    let edges = [(0, 1, 4), (0, 2, 5), (1, 2, -3), (2, 3, 4)];
    println!("{:?}", bellman_ford(4, &edges, 0));
}
