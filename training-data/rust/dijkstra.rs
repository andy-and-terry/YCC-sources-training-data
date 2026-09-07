use std::cmp::Ordering;
use std::collections::BinaryHeap;

struct State {
    cost: i32,
    node: usize,
}

impl Eq for State {}

impl PartialEq for State {
    fn eq(&self, other: &Self) -> bool {
        self.cost == other.cost
    }
}

impl Ord for State {
    fn cmp(&self, other: &Self) -> Ordering {
        other.cost.cmp(&self.cost)
    }
}

impl PartialOrd for State {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

fn dijkstra(num_nodes: usize, adj: &[Vec<(usize, i32)>], source: usize) -> Vec<i32> {
    let mut dist = vec![i32::MAX; num_nodes];
    dist[source] = 0;
    let mut heap = BinaryHeap::new();
    heap.push(State { cost: 0, node: source });

    while let Some(State { cost, node }) = heap.pop() {
        if cost > dist[node] {
            continue;
        }
        for &(neighbor, weight) in &adj[node] {
            let next_cost = cost + weight;
            if next_cost < dist[neighbor] {
                dist[neighbor] = next_cost;
                heap.push(State { cost: next_cost, node: neighbor });
            }
        }
    }
    dist
}

fn main() {
    let adj = vec![
        vec![(1, 1), (2, 4)],
        vec![(2, 2), (3, 5)],
        vec![(3, 1)],
        vec![],
    ];
    println!("{:?}", dijkstra(4, &adj, 0));
}
