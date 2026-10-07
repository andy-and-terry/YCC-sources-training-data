#[derive(Clone, Copy, PartialEq)]
enum State {
    Unvisited,
    Visiting,
    Done,
}

fn has_cycle(adj: &[Vec<usize>]) -> bool {
    let mut state = vec![State::Unvisited; adj.len()];
    for node in 0..adj.len() {
        if state[node] == State::Unvisited && visit(node, adj, &mut state) {
            return true;
        }
    }
    false
}

fn visit(node: usize, adj: &[Vec<usize>], state: &mut [State]) -> bool {
    state[node] = State::Visiting;
    for &next in &adj[node] {
        match state[next] {
            State::Visiting => return true,
            State::Unvisited => {
                if visit(next, adj, state) {
                    return true;
                }
            }
            State::Done => {}
        }
    }
    state[node] = State::Done;
    false
}

fn main() {
    let acyclic = vec![vec![1], vec![2], vec![]];
    let cyclic = vec![vec![1], vec![2], vec![0]];
    println!("acyclic graph has cycle: {}", has_cycle(&acyclic));
    println!("cyclic graph has cycle: {}", has_cycle(&cyclic));
}
