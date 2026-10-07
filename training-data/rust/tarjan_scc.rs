// Tarjan's algorithm: a single DFS pass finds strongly connected
// components using a discovery-index stack and low-link values --
// no second pass over a transposed graph is needed.

struct TarjanState {
    index_counter: usize,
    indices: Vec<Option<usize>>,
    low_links: Vec<usize>,
    on_stack: Vec<bool>,
    stack: Vec<usize>,
    components: Vec<Vec<usize>>,
}

fn strong_connect(v: usize, graph: &[Vec<usize>], state: &mut TarjanState) {
    state.indices[v] = Some(state.index_counter);
    state.low_links[v] = state.index_counter;
    state.index_counter += 1;
    state.stack.push(v);
    state.on_stack[v] = true;

    for &w in &graph[v] {
        if state.indices[w].is_none() {
            strong_connect(w, graph, state);
            state.low_links[v] = state.low_links[v].min(state.low_links[w]);
        } else if state.on_stack[w] {
            state.low_links[v] = state.low_links[v].min(state.indices[w].unwrap());
        }
    }

    if state.low_links[v] == state.indices[v].unwrap() {
        let mut component = Vec::new();
        loop {
            let w = state.stack.pop().unwrap();
            state.on_stack[w] = false;
            component.push(w);
            if w == v {
                break;
            }
        }
        state.components.push(component);
    }
}

fn tarjan_scc(graph: &[Vec<usize>]) -> Vec<Vec<usize>> {
    let n = graph.len();
    let mut state = TarjanState {
        index_counter: 0,
        indices: vec![None; n],
        low_links: vec![0; n],
        on_stack: vec![false; n],
        stack: Vec::new(),
        components: Vec::new(),
    };
    for v in 0..n {
        if state.indices[v].is_none() {
            strong_connect(v, graph, &mut state);
        }
    }
    state.components
}

fn main() {
    // 0->1, 1->2, 2->0 (a cycle), 2->3, 3->4, 4->5, 5->3 (another cycle)
    let graph = vec![
        vec![1],
        vec![2],
        vec![0, 3],
        vec![4],
        vec![5],
        vec![3],
    ];
    for mut scc in tarjan_scc(&graph) {
        scc.sort_unstable();
        println!("{:?}", scc);
    }
}
