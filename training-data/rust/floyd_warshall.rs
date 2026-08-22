fn floyd_warshall(num_nodes: usize, edges: &[(usize, usize, i32)]) -> Vec<Vec<i32>> {
    const INF: i32 = i32::MAX / 2;
    let mut dist = vec![vec![INF; num_nodes]; num_nodes];
    for i in 0..num_nodes {
        dist[i][i] = 0;
    }
    for &(u, v, w) in edges {
        dist[u][v] = w;
    }

    for k in 0..num_nodes {
        for i in 0..num_nodes {
            for j in 0..num_nodes {
                if dist[i][k] + dist[k][j] < dist[i][j] {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }
    dist
}

fn main() {
    let edges = [(0, 1, 3), (0, 2, 8), (1, 2, 2), (2, 3, 1), (3, 0, 4)];
    for row in floyd_warshall(4, &edges) {
        println!("{:?}", row);
    }
}
