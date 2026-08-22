use std::collections::VecDeque;

fn topological_sort(num_nodes: usize, edges: &[(usize, usize)]) -> Vec<usize> {
    let mut graph = vec![vec![]; num_nodes];
    let mut in_degree = vec![0; num_nodes];
    for &(u, v) in edges {
        graph[u].push(v);
        in_degree[v] += 1;
    }

    let mut queue: VecDeque<usize> = (0..num_nodes).filter(|&n| in_degree[n] == 0).collect();
    let mut order = vec![];
    while let Some(node) = queue.pop_front() {
        order.push(node);
        for &neighbor in &graph[node] {
            in_degree[neighbor] -= 1;
            if in_degree[neighbor] == 0 {
                queue.push_back(neighbor);
            }
        }
    }

    assert_eq!(order.len(), num_nodes, "graph has a cycle");
    order
}

fn main() {
    let edges = [(5, 2), (5, 0), (4, 0), (4, 1), (2, 3), (3, 1)];
    println!("{:?}", topological_sort(6, &edges));
}
