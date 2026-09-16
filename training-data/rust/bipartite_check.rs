use std::collections::{HashMap, VecDeque};

fn is_bipartite(num_nodes: usize, edges: &[(usize, usize)]) -> bool {
    let mut graph: HashMap<usize, Vec<usize>> = HashMap::new();
    for &(u, v) in edges {
        graph.entry(u).or_default().push(v);
        graph.entry(v).or_default().push(u);
    }

    let mut color: HashMap<usize, i32> = HashMap::new();

    for start in 0..num_nodes {
        if color.contains_key(&start) {
            continue;
        }
        color.insert(start, 0);
        let mut queue = VecDeque::new();
        queue.push_back(start);

        while let Some(node) = queue.pop_front() {
            let node_color = color[&node];
            if let Some(neighbors) = graph.get(&node) {
                for &neighbor in neighbors {
                    match color.get(&neighbor) {
                        None => {
                            color.insert(neighbor, 1 - node_color);
                            queue.push_back(neighbor);
                        }
                        Some(&c) if c == node_color => return false,
                        _ => {}
                    }
                }
            }
        }
    }

    true
}

fn main() {
    let even_cycle = [(0, 1), (1, 2), (2, 3), (3, 0)];
    let odd_cycle = [(0, 1), (1, 2), (2, 0)];
    println!("{}", is_bipartite(4, &even_cycle));
    println!("{}", is_bipartite(3, &odd_cycle));
}
